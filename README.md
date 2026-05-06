
# OPUS - OpenSubtitles development and testdata

A repository of aligned subtitles from OpenSubtitles to be used as development and test data in machine translation. Subtitles from 2024 have been reserved to be heldout data for development and test data.

The essential resources are the following:

* **Training data:** [OpenSubtitles v2024](https://opus.nlpl.eu/datasets/OpenSubtitles) (access through the [OPUS API](https://opus.nlpl.eu/opusapi) and [OpusTools](https://pypi.org/project/opustools/))
* **Bilingual test sets:** [OpenSubtitles2024-testset.zip](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/OpenSubtitles2024-testset.zip)
* **Bilingual development sets:** [OpenSubtitles2024-devset.zip](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/OpenSubtitles2024-devset.zip)
* **Multilingual test set:** [OpenSubtitles2024-multiset.zip](https://raw.githubusercontent.com/Helsinki-NLP/OpenSubtitles-devtest/refs/heads/master/devtest-xml/multi-linksets-0.9/2024/ar-bg-cs-da-de-el-en-es-et-fa-fi-fr-he-hi-hr-hu-id-it-ko-lt-lv-ms-nl-no-pl-pt-pt_BR-ro-ru-sk-sl-sr-sv-ta-te-tr-uk-vi-zh_CN-zh_TW.zip)
* **Hugging Face:** [Bilingual dev/test sets](https://huggingface.co/datasets/Helsinki-NLP/OpenSubtitles2024), [multilingual test set](https://huggingface.co/datasets/Helsinki-NLP/OpenSubtitles2024-40-langs-15-movies)
* **Browsing Interface**: [OPUS Testset Explorer Website](https://opus.nlpl.eu/bench/explore)
* **Paper:** Tiedemann, J., & Luo, H. (2026). [OpenSubtitles2024: A Massively Parallel Dataset of Movie Subtitles for MT Development and Evaluation](https://doi.org/10.63317/4ivg578ub2ob). In Proceedings of the Fifteenth Language Resources and Evaluation Conference (LREC 2026) (pp. 8897–8907). European Language Resources Association (ELRA).

```bibtex
@inproceedings{tiedemann-etal-2026-opensubtitles2024,
  title = {OpenSubtitles2024: A Massively Parallel Dataset of Movie Subtitles for MT Development and Evaluation},
  author = {Tiedemann, Joerg and Luo, Hengyu},
  booktitle = {Proceedings of the Fifteenth Language Resources and Evaluation Conference (LREC 2026)},
  month = {May},
  year = {2026},
  pages = {8897--8907},
  address = {Palma, Mallorca, Spain},
  publisher = {European Language Resources Association (ELRA)},
  doi = {10.63317/4ivg578ub2ob},
}
```

**Note:** The zipfiles of the aligned plain text files are password protected to avoid crawlers to include the testsets (at least in this aligned form) in potential training data. The password is the same as the file name without the file extension `.zip`. For the multilingual test set the password is `OpenSubtitles2024-multiset`.

Some more details about the data sets and how they have been created are given below.


## Alignment scores

Alignment scores are computed for each pair of subtitles from a movie/series-episode. Ths score gives the proportion of non-empty alignments assuming that subtitles that align without gaps are better aligned than subtitle pairs with a lot of empty sentence alignments (i.e. text that does not have a corresponding translation with an overlapping time slot). This score is used to select high-quality subsitles in the test sets below.


## Bilingual testsets

Bilingual testsets are not multiparallel (i.e. do not cover the same movies for each language pair) and have been extracted to include at least one movie/series-episode and at most 5 movies/series-episodes per language pair. Alignment scores need to be above 0.8 and the movies are selected to have the best alignment score.

* [Testsets in aligned plain text format](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/OpenSubtitles2024-testset.zip): Zipfile of all aligned plain text files with sentences on corresponding lines (Moses format).
* [Testset Sentence Alignment in XML](devtest-xml/test): Sentence alignments as standoff annotation in XCES Align format (`xx-yy.xml.gz` files with `xx` and `yy` being source and target language ID's; `xx-yy.xml.gz.scores` list alignment scores for the selected subtitle pairs)
* [Subtitle XML files (untokenized)](devtest-raw): Subtitle files in XML format (`xx.zip` with `xx` being a language ID); Files can be downloaded from `https://object.pouta.csc.fi/OPUS-OpenSubtitle-devtest/devtest-raw/xx.zip` (replacing `xx` with the language ID of interest)
* [Subtitle XML files (tokenized)](devtest-xml): Tokenized subtitle files in XML format (`xx.zip` with `xx` being a language ID) Files can be downloaded from `https://object.pouta.csc.fi/OPUS-OpenSubtitle-devtest/devtest-xml/xx.zip` (replacing `xx` with the language ID of interest)


Non-selected subtitle files are available as aligned development data:


* [Devsets in aligned plain text format](https://object.pouta.csc.fi/OPUS-OpenSubtitles-devtest/OpenSubtitles2024-devset.zip): Zipfile of all aligned plain text files with sentences on corresponding lines (Moses format).
* [Devset Sentence Alignment in XML](devtest-xml/dev): Sentence alignments as standoff annotation in XCES Align format (`xx-yy.xml.gz` files with `xx` and `yy` being source and target language ID's; `xx-yy.xml.gz.scores` list alignment scores for the selected subtitle pairs)

The subtitles in XML format are all includes in the language-specific zip-files (see testsets above)


**Note:** The zipfiles of the aligned plain text files are password protected to avoid crawlers to include the testsets (at least in this aligned form) in potential training data. The password is the same as the file name without the file extension `.zip`.


## Multilingual testsets

Multilingual testsets corersponds to sets of multi-way parallel test data in which all subtitles are covered for all selected movies/series-episodes for all languages included in the testset. The alignments are entirely synchronized across all languages involved. We extracted a dataset that covers 40 languages and language variants and a selection of 16 subtitle files:

* [opensubtitles2024-multitest](https://raw.githubusercontent.com/Helsinki-NLP/OpenSubtitles-devtest/refs/heads/master/devtest-xml/multi-linksets-0.9/2024/ar-bg-cs-da-de-el-en-es-et-fa-fi-fr-he-hi-hr-hu-id-it-ko-lt-lv-ms-nl-no-pl-pt-pt_BR-ro-ru-sk-sl-sr-sv-ta-te-tr-uk-vi-zh_CN-zh_TW.zip)

The zip-file contains sentence alignment files in standoff XCES Align annotation (`langset/movieID/xx-yy.xml` with `langset` replaced by the set of languages in the set, `movieID` referring to the movie/series that is covered by the substitles, and `xx` and `yy` referring to source and target language codes) and aligned plain text files for each movie/series in the testset. The languages included in the data set are: ar bg cs da de el en es et fa fi fr he hi hr hu id it ko lt lv ms nl no pl pt pt_BR ro ru sk sl sr sv ta te tr uk vi zh_CN zh_TW

The plain text files are aligned across all languages in the text with corresponding text on identical lines in each subtitle file.

**Note:** The zipfiles are password protected to avoid crawlers to include the testsets (at least in this aligned form) in potential training data. The password is `OpenSubtitles2024-multiset`.

Besides of this selected test set, we also provide alternative sets that have been extracted from OpenSubtitles2024. Those test sets have different kinds of language and subtitle coverage and are also based on different alignment thresholds. All download links are available from the following sub pages:

* [linksets with alignment threshold 0.9](devtest-xml/multi-linksets-0.9/)
* [linksets with alignment threshold 0.8](devtest-xml/multi-linksets-0.8/)
* [linksets with no alignment threshold](devtest-xml/multi-linksets-all/)

The datasets have been extracted with alignment thresholds 0.8, 0.9 and no alignment threshold (= all). Each dataset is distributed in a separate zipfile.


## Acknowledgements

First of all we would like to thank [opensubtitles.org](https://www.opensubtitles.org) for providing the resources and the friendly collaboration. This work was supported by the European Union's Horizon Europe research and innovation programme under grant agreement No 101070350 (the [HPLT project](https://hplt-project.org)), by the [OpenEuroLLM project](https://openeurollm.eu), co-funded by the Digital Europe Programme under GA no. 101195233, and by the AI-DOC program hosted at the Finnish Center of Artificial Intelligence (decision number VN/3137/2024-OKM-6). We would also like to thank [CSC IT Center for Science](https://csc.fi/en/) (Finland), and the [LUMI supercomputer](https://lumi-supercomputer.eu) (owned by the EuroHPC Joint Undertaking) for providing computational resources.
