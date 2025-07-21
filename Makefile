

include Makefile.def
include Makefile.submit



CONTAINER        := OPUS-OpenSubtitles-devtest
MAXSIZE          := 5G
SWIFT_PARAMS_BIG := --use-slo --segment-size ${MAXSIZE}


upload: upload-zip upload-algfiles

upload-zip:
	which a-get
	swift upload ${CONTAINER} --changed --skip-identical ${SWIFT_PARAMS_BIG} devtest-raw/encrypted
	swift upload ${CONTAINER} --changed --skip-identical ${SWIFT_PARAMS_BIG} devtest-xml/encrypted
	swift upload ${CONTAINER} --changed --skip-identical ${SWIFT_PARAMS_BIG} *.zip

upload-algfiles:
	which a-get
	swift upload ${CONTAINER} --changed --skip-identical devtest-xml/*.gz
	swift upload ${CONTAINER} --changed --skip-identical devtest-alt

#	find devtest-xml -maxdepth 1 -name '*.gz' -exec \
#		swift upload ${CONTAINER} --changed --skip-identical {} \;



## create password-protected zipfile of MT testsets

.PHONY: testset
testset: OpenSubtitles2024-testset.zip

OpenSubtitles2024-testset.zip: OpenSubtitles2024/test
	zip -r --password OpenSubtitles2024-testset $@ $<
	find $< -delete

OpenSubtitles2024/test:
	${MAKE} -C devtest-raw testsets
	mkdir -p $(dir $@)
	mv devtest-raw/test $@


## create password-protected zipfile of MT devsets

.PHONY: devset
devset: OpenSubtitles2024-devset.zip

OpenSubtitles2024-devset.zip: OpenSubtitles2024/dev
	zip -r --password OpenSubtitles2024-devset $@ $<
	find $< -delete

OpenSubtitles2024/dev:
	${MAKE} -C devtest-raw devsets
	mkdir -p $(dir $@)
	mv devtest-raw/dev $@

