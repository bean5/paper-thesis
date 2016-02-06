.PHONY: build

build:
	@-make clean
	-(docker-compose build && docker-compose run build)
	# cp main.pdf build/thesis-LDS_SCI_Recommender_Systems-Michael_Bean.pdf
	@-make simpleClean

project.pdf: master.tex refs.bib
	# Makes images work, but biblio section is missing.
	# Make sure to hit enter when errors appear...
	pdflatex master
	bibtex master
	pdflatex master
	pdflatex master


	# # Seems to make references work (referenced with numbers), but biblio section and images are missing.
	# latex master.tex
	# bibtex master.aux
	# latex master.tex
	# latex master.tex
	#
	# # http://tex.stackexchange.com/questions/21405/how-to-create-pdf-with-command-line-using-miktex
	# dvips -P pdf master.dvi
	# ps2pdf master.ps
	# # dvipdfm master.dvi


	# Other things to try
	# lualatex master

	@echo "================================================"
	@echo "All done! project.pdf has been created."
	@echo "================================================"

simpleClean:
	rm -rf *.log *.blg *.bbl *.aux *.dvi *.lot *.lof *.toc *.ps *.out *.brf *~

clean:
	make simpleClean
	rm -rf master.pdf
