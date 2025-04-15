

BASEURL := https://raw.githubusercontent.com/Helsinki-NLP/OpenSubtitles-devtest/refs/heads/master/devtest-xml/multi-linksets-all

MULTISETS := $(sort $(patsubst %.zip,%,$(notdir $(wildcard 2024/*.zip))))


README.md:
	echo "# Multilingual OpenSubtitles Test Sets (no alignment threshold)"    > $@
	echo ""                                         >> $@
	echo "| Nr of Languages | Nr of Subtitles | Languages | Subtitles | Download Link |" >> $@
	echo "|-----------------|-----------------|-----------|-----------|---------------|" >> $@

	for m in ${MULTISETS}; do \
	  echo "processing $$m"; \
	  echo -n '| ' >> $@; \
	  echo $$m | tr '-' "\n" | wc -l | tr "\n" ' ' >> $@; \
	  echo -n '| ' >> $@; \
	  unzip -Z1 2024/$$m.zip | cut -f4 -d/ | cut -f1 -d. | sort -u | wc -l | tr "\n" ' ' >> $@; \
	  echo -n '| ' >> $@; \
	  echo -n $$m | tr '-' " " >> $@; \
	  echo -n '| ' >> $@; \
	  unzip -Z1 2024/$$m.zip | cut -f4 -d/ | cut -f1 -d. | sort -u | tr "\n" ' ' >> $@; \
	  echo -n '| ' >> $@; \
	  echo "[$$m.zip](${BASEURL}/2024/$$m.zip)" >> $@; \
	done
