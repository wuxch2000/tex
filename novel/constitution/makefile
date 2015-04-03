# make file for latex

LIB_PATH     = $(MINGW_PATH)/lib

MAIN_FILE = constitution.tex
OTHER_FILE = wuxch_config.tex

MAIN_PDF_FILE = $(MAIN_FILE:%.tex=%.pdf)

MAIN_DVI_FILE = $(MAIN_FILE:%.tex=%.dvi)

MAIN_OUT_FILE = $(MAIN_FILE:%.tex=%.out)

ALL_AUX_FILE = $(MAIN_FILE:%.tex=%.aux) $(OTHER_FILE:%.tex=%.aux)

ALL_TEX_FILE = $(MAIN_FILE) $(OTHER_FILE)

TEMP_FILE = $(ALL_AUX_FILE)			 \
			$(MAIN_FILE:%.tex=%.log) \
			$(OTHER_FILE:%.tex=%.log) \
			$(MAIN_FILE:%.tex=%.toc) \
			$(MAIN_OUT_FILE)		 \
			$(MAIN_OUT_FILE).bak

TEX_COMPILER = latex.exe
DVI_COMPILER = dvipdfmx.exe
GBK_TOC_PATCH = gbk2uni.exe
PDF_VIEWR = "C:\Program Files\Adobe\Reader 9.0\Reader\AcroRd32.exe"
DVI_COMPILE_FLAG = 

.PHONY : rm re clean test toc

# open : $(MAIN_PDF_FILE)
# 	$(PDF_VIEWR) $(MAIN_PDF_FILE)

pdf : $(MAIN_DVI_FILE)
	make $(MAIN_PDF_FILE)

dvi : $(ALL_TEX_FILE)
	make $(MAIN_DVI_FILE)

# 因为制作pdf索引目录的时候，有时需要两次latex。

toc : 
	$(GBK_TOC_PATCH) $(MAIN_OUT_FILE)
	$(TEX_COMPILER) $(MAIN_FILE)

%.pdf : %.dvi
	@echo compiling $< ...
	make toc
	$(DVI_COMPILER) $(DVI_COMPILE_FLAG) $<

%.dvi : %.tex
	@echo compiling $< ...
	$(TEX_COMPILER) $<


rm:
	del $(MAIN_PDF_FILE) $(MAIN_DVI_FILE) $(TEMP_FILE)

clean:
	make rm

test:
	@echo $(MAIN_FILE)
