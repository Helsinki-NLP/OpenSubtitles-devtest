#
# remove generated subtitles from zip files
#

include ../Makefile.def
include ../Makefile.submit


## assumes that we are inside OPUS-ingest/corpus/OpenSubtitles
LANG_ZIPFILES  := $(notdir $(wildcard ../raw/*.zip))


.PHONY: all all-jobs
all all-jobs:
	-${MAKE} extract-devtest
	${MAKE} testset
	${MAKE} devset
	touch all.done


## create password-protected zipfile of MT testsets

.PHONY: testset
testset: OpenSubtitles2024-testset.zip

OpenSubtitles2024-testset.zip: OpenSubtitles2024/test
	zip -r --password OpenSubtitles2024-testset $@ $<
	find $< -delete

OpenSubtitles2024/test:
	${MAKE} testsets
	mkdir -p $(dir $@)
	mv test $@


## create password-protected zipfile of MT devsets

.PHONY: devset
devset: OpenSubtitles2024-devset.zip

OpenSubtitles2024-devset.zip: OpenSubtitles2024/dev
	zip -r --password OpenSubtitles2024-devset $@ $<
	find $< -delete

OpenSubtitles2024/dev:
	${MAKE} devsets
	mkdir -p $(dir $@)
	mv dev $@



## extract devtest data from the subtitle files
## (selected year that we reserve for dev and test data = DEVTEST_YEAR)

.PHONY: extract-devtest
extract-devtest: ${LANG_ZIPFILES}

%.zip:
	mkdir -p ${CORPUS}/raw/$(@:.zip=)
	echo "reserved devtest subtitles (release year ${DEVTEST_YEAR})" > ${CORPUS}/raw/$(@:.zip=)/README
	unzip ../raw/$@ '*/$(@:.zip=)/${DEVTEST_YEAR}/*'
	zip -rq $@ ${CORPUS}/raw/$(@:.zip=)
	find ${CORPUS}/raw/$(@:.zip=) -delete
	zip ../raw/$@ -d '*/$(@:.zip=)/${DEVTEST_YEAR}/*'



TESTSET_ALG_FILES  := $(patsubst ../devtest-xml/test/%.xml.gz,test/%.log,$(wildcard ../devtest-xml/test/*.xml.gz))
DEVSET_ALG_FILES   := $(patsubst ../devtest-xml/dev/%.xml.gz,dev/%.log,$(wildcard ../devtest-xml/dev/*.xml.gz))


testsets: ${TESTSET_ALG_FILES}
devsets: ${DEVSET_ALG_FILES}


# for plain text files:
#
#  zcat test/de-en.xml.gz | opus2bitext -D -c 0.8 -C overlap -e source-file -f target-file

${TESTSET_ALG_FILES} ${DEVSET_ALG_FILES}: %.log: ../devtest-xml/%.xml.gz
	mkdir -p $(dir $@)
	-zcat $< | \
	opus2bitext -D \
		-e $(@:.log=.$(firstword $(subst -, ,$(notdir $(@:.log=))))) \
		-f $(@:.log=.$(lastword $(subst -, ,$(notdir $(@:.log=))))) 2> $@

## for selecting only high-overlapping alignments do:
#
#	opus2bitext -c 0.8 -C overlap \
#		-e $(@:.log=.$(firstword $(subst -, ,$(notdir $(@:.log=))))) \
#		-f $(@:.log=.$(lastword $(subst -, ,$(notdir $(@:.log=))))) 2> $@


../devtest-xml/%.xml.gz:
	${MAKE} -C ../devtest-xml $(patsubst ../devtest-xml/%.xml.gz,%.xml.gz,$@)
