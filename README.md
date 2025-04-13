
# OPUS - OpenSubtitles development and testdata

A repository of aligned subtitles from OpenSubtitles to be used as development and test data in machine translation. Subtitles from 2024 have been reserved to be heldout data for development and test data.



## Alignment scores

Alignment scores are computed for each pair of subtitles from a movie/series-episode. Ths score gives the proportion of non-empty alignments assuming that subtitles that align without gaps are better aligned than subtitle pairs with a lot of empty sentence alignments (i.e. text that does not have a corresponding translation with an overlapping time slot). This score is used to select high-quality subsitles in the test sets below.


## Bilingual testsets

Bilingual testsets are not multiparallel (i.e. do not cover the same movies for each language pair) and have been extracted to include at least one movie/series-episode and at most 5 movies/series-episodes per language pair. Alignment scores need to be above 0.8 and the movies are selected to have the best alignment score.

* [Testsets in aligned plain text format](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/devtest-raw/OpenSubtitles2024-testset.zip): Zipfile of all aligned plain text files with sentences on corresponding lines (Moses format).
* [Testset Sentence Alignment in XML](devtest-xml/test): Sentence alignments as standoff annotation in XCES Align format (`xx-yy.xml.gz` files with `xx` and `yy` being source and target language ID's; `xx-yy.xml.gz.scores` list alignment scores for the selected subtitle pairs)
* [Subtitle XML files (untokenized)](devtest-raw): Subtitle files in XML format (`xx.zip` with `xx` being a language ID); Files can be downloaded from `https://object.pouta.csc.fi/OPUS-OpenSubtitle-devtest/devtest-raw/xx.zip` (replacing `xx` with the language ID of interest)
* [Subtitle XML files (tokenized)](devtest-xml): Tokenized subtitle files in XML format (`xx.zip` with `xx` being a language ID) Files can be downloaded from `https://object.pouta.csc.fi/OPUS-OpenSubtitle-devtest/devtest-xml/xx.zip` (replacing `xx` with the language ID of interest)


Non-selected subtitle files are available as aligned development data:


* [Devsets in aligned plain text format](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/devtest-raw/OpenSubtitles2024-devset.zip): Zipfile of all aligned plain text files with sentences on corresponding lines (Moses format).
* [Testset Sentence Alignment in XML](devtest-xml/dev): Sentence alignments as standoff annotation in XCES Align format (`xx-yy.xml.gz` files with `xx` and `yy` being source and target language ID's; `xx-yy.xml.gz.scores` list alignment scores for the selected subtitle pairs)

The subtitles in XML format are all includes in the language-specific zip-files (see testsets above)


**Note:** The zipfiles of the aligned plain text files are password protexted to avoid crawlers to include the testsets (at least in this aligned form) in potential training data. The password is the same as the file name without the file extension `.zip`.


## Multilingual testsets

Multilingual testsets corersponds to sets of multi-parallel test data in which all subtitles are covered for all selected movies/series-episodes for all languages included in the testset. There are various datasets with different language coverage in this collections.


The datasets have been extracted with different alignment thresholds: 0.8, 0.9, and no alignment threshold (= all). Each dataset is distributed in a separate zipfile:

* [linksets with alignment threshold 0.9](devtest-xml/multi-linksets-0.9/2024/)
* [linksets with alignment threshold 0.8](devtest-xml/multi-linksets-0.8/2024/)
* [linksets with no alignment threshold](devtest-xml/multi-linksets-all/2024/)


Each zip-file contains sentence alignment files in standoff XCES Align annotation (`langset/movieID/xx-yy.xml` with `langset` replaced by the set of languages in the set, `movieID` referring to the movie/series that is covered by the substitles, and `xx` and `yy` referring to source and target language codes) and aligned plain text files for each movie/series in the testset.

The plain text files are aligned across all languages in the text with corresponding text on identical lines in each subtitle file.

**Note:** The zipfiles are password protexted to avoid crawlers to include the testsets (at least in this aligned form) in potential training data. The password is `OpenSubtitles2024-multiset`.