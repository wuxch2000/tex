### make file for latex
# principle: pdf file depends on dvi file, dvi file depends on toc file and aux file, toc and aux depends on tex file.
#
#                                   +-----+ gbk2uni(chinese need)
#                           +------>+ toc +---------------------+
#                           |       +-----+                     |
#                           |       +-----+                     |
#            +-----+ latex  +------>+ aux +---------------------+ latex  +-----+ dvipdfmx  +-----+
#            | tex +------->+       +-----+                     +------->+ dvi +---------->+ pdf |
#            +-----+        |       +-----+                     |        +-----+           +-----+
#                           +------>+ dvi +---------------------+
#                           |       +-----+                     |
#                           |       +-----+ makeindex  +-----+  |
#                           +------>+ idx +----------->| ind +--+
#                                   +-----+ (opional)  +-----+
#

LIB_PATH     = $(MINGW_PATH)/lib

MAIN_FILE = 
CONFIG_FILE = 

MAIN_PDF_FILE = $(MAIN_FILE:%.tex=%.pdf)
MAIN_DVI_FILE = $(MAIN_FILE:%.tex=%.dvi)
MAIN_OUT_FILE = $(MAIN_FILE:%.tex=%.out)
MAIN_TOC_FILE = $(MAIN_FILE:%.tex=%.toc)
MAIN_IDX_FILE = $(MAIN_FILE:%.tex=%.idx)
MAIN_IND_FILE = $(MAIN_FILE:%.tex=%.ind)


ALL_AUX_FILE = $(MAIN_FILE:%.tex=%.aux) $(CONFIG_FILE:%.tex=%.aux)
ALL_TEX_FILE = $(MAIN_FILE) $(CONFIG_FILE)

TEMP_FILE = $(ALL_AUX_FILE)			 \
			$(MAIN_FILE:%.tex=%.log) \
			$(MAIN_FILE:%.tex=%.toc) \
			$(MAIN_FILE:%.tex=%.idx) \
			$(MAIN_FILE:%.tex=%.ilg) \
			$(MAIN_FILE:%.tex=%.ind) \
			$(MAIN_OUT_FILE)		 \
			$(addsuffix .bak,$(MAIN_OUT_FILE))

TEX_COMPILER = latex.exe
DVI_COMPILER = dvipdfmx.exe
GBK_TOC_PATCH = gbk2uni.exe
INDEX_COMPILER = makeindex.exe

TEX_COMPILE_FLAG = -quiet
DVI_COMPILE_FLAG = -q
GBK_TOC_FLAG = -s
INDEX_COMPILER_FLAG = -q

.PHONY : rm re clean test toc pdf dvi toc touch master

pdf : $(MAIN_DVI_FILE)
	make $(MAIN_PDF_FILE)

re :
	make rm
	make pdf

%.pdf : %.dvi
	@echo compiling $< to $@ ...
	$(DVI_COMPILER) $(DVI_COMPILE_FLAG) $<
	@echo compiling $< to $@ ... done

%.dvi : %.out
ifeq ($(index),on)
	make $(addsuffix .ind,$(basename $@))
endif
	@echo compiling $< to $@ ...
	$(TEX_COMPILER) $(TEX_COMPILE_FLAG) $(addsuffix .tex,$(basename $@))
	@echo compiling $< to $@ ... done

%.out : %.tex
	@echo compiling $< to $@ ...
	$(TEX_COMPILER) $(TEX_COMPILE_FLAG) $<
	$(GBK_TOC_PATCH) $(GBK_TOC_FLAG) $(addsuffix .out,$(basename $@))
	del $(addsuffix .dvi,$(basename $@))
	@echo compiling $< to $@ ... done

%.ind : %.idx
	@echo compiling $< to $@ ...
	$(INDEX_COMPILER) $(INDEX_COMPILER_FLAG) $<
	@echo compiling $< to $@ ... done

%.tex : ;
%.idx : ;

rm:
	del $(MAIN_PDF_FILE) $(MAIN_DVI_FILE) $(TEMP_FILE)

clean:
	make rm

test:
	@echo $(file)

touch:
	touch $(file)

master:
	make touch file=$(file)
	make $(addsuffix .pdf,$(basename $(file)))
