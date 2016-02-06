.PHONY: build

build:
	-(docker-compose build && docker-compose run build)
	# cp project.pdf build/thesis-LDS_SCI_Recommender_Systems-Michael_Bean.pdf
	make simpleClean

project.pdf: master.tex refs.bib
	latex master
	latex master
	# pdflatex master
	bibtex refs
	bibtex refs
	# pdflatex master
	# pdflatex master

	# http://tex.stackexchange.com/questions/21405/how-to-create-pdf-with-command-line-using-miktex
	dvips -P pdf master.dvi
	ps2pdf master.ps
	# dvipdfm master.dvi
	@echo "================================================"
	@echo "All done! project.pdf has been created."
	@echo "================================================"

simpleClean:
	rm -rf *.log *.blg *.bbl *.aux *.dvi *.lot *.lof *.toc *~

clean:
	make simpleClean
	rm -rf project.pdf
