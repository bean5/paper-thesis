.PHONY: build

build:
	-(docker-compose build && docker-compose run build)
	# cp project.pdf build/thesis-LDS_SCI_Recommender_Systems-Michael_Bean.pdf
	make simpleClean

project.pdf: master.tex refs.bib
	pdflatex master
	pdflatex master
	bibtex citations
	bibtex citations
	pdflatex master
	pdflatex master
	@echo "================================================"
	@echo "All done! project.pdf has been created."
	@echo "================================================"

simpleClean:
	rm -rf project.log project.blg project.bbl project.aux *.dvi *.log project.lof project.toc citations.log *~

clean:
	make simpleClean
	rm -rf project.pdf
