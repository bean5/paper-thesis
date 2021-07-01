.PHONY: addMakeFile build publish all prepTemp publishWithDate

build: addMakeFile
	docker-compose build build && docker-compose run build

publish: addMakeFile
	make publishWithDate date="$$(date +'%Y-%m-%d')"

addMakeFile:
	cp Makefile whitepaper/

publishWithDate:
	@echo "Copying in output folder."
	cp build/master.pdf /output/master-LDS_SCI_Recommender_Systems-Michael_Bean\ $(date).pdf
	cp build/literature_review.pdf /output/literature_review-Michael_Bean\ $(date).pdf

prepTemp:
	mkdir /tmp/latex

	# Move to temporary location that has copy of everything (less cleanup later)
	cp -r * /tmp/latex/

all: prepTemp compile_master.tex refs.bib
	make custom section=master
	# make custom section=abstract #abstract isn't actually a chapter, so compiling it separately doesn't work.
	make custom section=intro
	make custom section=intro_old
	make custom section=literature_review
	make custom section=methods
	make custom section=results
	make custom section=conclusion
	make custom section=future_work
	cp master.pdf /output/

custom:
	cd /tmp/latex/ && \
	pdflatex compile_$(section) && \
	bibtex compile_$(section) && \
	pdflatex compile_$(section) && \
	pdflatex compile_$(section) && \
	mv compile_$(section).pdf /main/build/$(section).pdf

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
	@echo "All done! PDF has been created."
	@echo "================================================"
