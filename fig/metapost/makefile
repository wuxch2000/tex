PDF = main.pdf
FIG = fig1.mp
FIG_OUT = fig1.1
DVI = main.dvi

TEX_COMPILER = latex.exe
DVI_COMPILER = dvipdfmx.exe
MPOST_COMPILER = mpost.exe

TEX_COMPILE_FLAG = -quiet
DVI_COMPILE_FLAG = -q

pdf : $(DVI)
	make $(PDF)

%.pdf : %.dvi
	@echo compiling $< to $@ ...
	$(DVI_COMPILER) $(DVI_COMPILE_FLAG) $<
	@echo compiling $< to $@ ... done

%.dvi : %.tex $(FIG_OUT)
	@echo compiling $< to $@ ...
	$(TEX_COMPILER) $(TEX_COMPILE_FLAG) $(addsuffix .tex,$(basename $@))
	@echo compiling $< to $@ ... done

$(FIG_OUT) : $(FIG)
	@echo compiling $< to $@ ...
	$(MPOST_COMPILER) $(FIG)
	@echo compiling $< to $@ ... done
