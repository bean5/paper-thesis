# My Thesis
My thesis. Actually, just the published paper for it. The actual code for the research is at <https://linguistics.byu.edu/thesisdata/relrec.html>. 

Now commencing start of template README.

# BYU Linguistics LaTeX Thesis Template
In an effort to save others from the pain and suffering that I have gone through to get the LaTeX and the BYU Thesis/Dissertations package to do what I wanted, I cleaned it up and made some changes. It tries to be a small, neat, clean tutorial (which I don't know how good of a job it does), but it provides all of the necessary details and a good structure to start from. The byustyle pacakge follows the model of the hyperref package (it has a few optional parameters and then a setup function to configure everything). I've tried to put comments around all of the commands to make it easier to make it do what you want but the general run down is this.

## Prerequisites:
There are two main routes to take. Either you can install install docker and make on your machine, or you can install LaTeX+make on your machine. The docker route is better supported here and more trustworthy in my opinion. I really like the fact that using dockers keeps package dependencies from cluttering your machine, so I advise that route (it is also best supported here). I have found LaTeX to be most supported on Linux, which is what docker uses.

It is highly advised that you use a Linux or Mac machine when building your document. However, if you are an experienced LaTeX user who is just looking for a BYU Linguistics template and already has the LaTeX dependencies installed, then you should be able to use the files here to build your thesis, at least if you are using ubuntu 14.04.

### Advised Mac-specific Pre-requisites Install Instructions

1. Install homebrew (a.k.a. 'brew'). By following the instructions at http://brew.sh/.
2. Install gnumake, using brew by running this command in your terminal: `brew install gnumake`
3. Install docker toolbox following the instructions at https://www.docker.com/products/docker-toolbox. This installs docker, docker-compose, and virtualbox

### Advised Linux-specific Pre-requisites Install Instructions

1. Use Ubuntu 14.04
2. Install gnumake: `sudo apt-get install -y`
3. Install docker following the instructions at https://docs.docker.com/engine/installation/
4. Install docker-compose following the instructions at https://docs.docker.com/compose/

When using Ubuntu, there is no need to have VirtualBox installed. Docker is natively supported in Ubuntu.

## Use Instructions:
1. If you have make docker and make installed, you can simply run `make`. If you don't have docker, but have LaTeX and make, you can run `make project.pdf`. **Note**: The first time you run this, a docker will be built, which contains various LaTeX packages. This may take hours to build for the first time. After that, it will be superfast as long as you haven't updated the `Dockerfile` or removed the docker that was built.
2. Once you have built the document, you can run `make publish`. This will run the make target that copies `project.pdf` and names it to match your thesis title (see the Makefile).
3. Since the Abstract and Acknowledgements need to be single spaced (and I couldn't figure out how to force it to skip even pages), you'll need to uncomment the \\afterpage{\\cleardoublepage} command in the abstract.tex and acknowledgements.tex files, if they are more than one page. If they're not then you'll need to be sure to have the singlepageabstract and/or singlepageacknowledgements options set to true, or else the top margin will not be correct.

If you haven't introduced errors, you should be able to locate your document at `builds/master.pdf`.

## Other Little Tips:
1. You'll need to set all of the name properties or you can make them use defaults (big ugly text that says it's missing) by using the option usedefaultnames.
2. The copyrightyear will just set itself to the current year, but you can change that if you want.
3. You can turn off any part of the BYU header using the commands in the \\byustylesetup{} on line 36 through 46.
4. Let's say that you just want to print one chapter for some hard copy editing but you don't want to screw up all of the chapter numbers and bibTeX stuff, then you'll notice some commands on line 128 through 130. Those commands will make LaTeX only put that chapter in the generated document but leave all of the numbering and such untouched. You can also do multiple chapters by doing stuff like \\includeonly{synchronization,results}. It's a nice little trick that I've really liked using.
5. You might have noticed the weird little comment at the bottom of master.tex ( %input "..\\..\\bib\\refs.bib"), if you're using WinEdit (which I highly recommend) this tells it where your refs.bib is at and then you can just type in \\cite{} and it will pop up a drop down list of all of your references. It's a nice little feature and helps avoid the ?'s from when you misspell a citation.

## Printing Tips:
1. When you print your PDF make sure that "Page Scaling" is set to "None". The default value is "Fit to Printer Margins" and this will cause everything to be not quite the right size.
2. Also, check to make sure that your document is the right size (8.5" x 11"). It has been discovered that several LaTeX installation's default to generating a document that is on A4 paper and this will cause your margins to be off throughout your document when you print. To fix this follow these steps (with MikTeX):
	1. Go to the "dvipdfm\config" folder in your MikTeX installation ("C:\texmf" by default) and edit the "config" file in a text editor

	2. Change "p a4" to "p letter"

	3. Go to the "dvips\config" folder in your MikTeX installation ("C:\texmf" by default) and edit the "config.ps" file in a text editor

	4. Make sure that "letterSize" is the first entry in the list of paper sizes by changing the order from
		```
		@ A4size 594.99bp 841.99bp
			@+ ! %%DocumentPaperSizes: a4
		@+ %%PaperSize: A4

		@ letterSize 8.5in 11in
		@+ ! %%DocumentPaperSizes: Letter
		```
	to
		```
		@ letterSize 8.5in 11in
		@+ ! %%DocumentPaperSizes: Letter

		@ A4size 594.99bp 841.99bp
		@+ ! %%DocumentPaperSizes: a4
		@+ %%PaperSize: A4
		```

## To Do:
For anyone that feels like playing around with this or who is a LaTeX master, I tried to get all of the \\showBYUHeader stuff in \\AtBeginDocument but I couldn't get it to work. It would be nice if someone could figure out how to do that, because then the header include would just be automatic from using the package.

Hopefully, this will help stop people from pulling out as many hairs as I have.

Dave Johansen

davejohansen@gmail.com

AND 'bean5'

bean5@users.noreply.github.com

## Partial Changelog
**Note**: For actual changelog, see git commit history and the `README.txt` for the ECEn template at http://www.ee.byu.edu/grad/latex/.

### 2016 Feb

**Corrections**:

* master.tex- 1-usepackage call of hyperref corrected to have driverfallback.

**Improvements**:

* natbib implemented instead of IEEE style. This makes the bibliography and citations much more APA-like.
