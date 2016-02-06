In an effort to save others from the pain and suffering that I have gone through to get the LaTeX and the BYU Thesis/Dissertations package to do what I wanted, I cleaned it up and made some changes. It tries to be a small, neat, clean tutorial (which I don't know how good of a job it does), but it provides all of the necessary details and a good structure to start from. The byustyle pacakge follows the model of the hyperref package (it has a few optional parameters and then a setup function to configure everything). I've tried to put comments around all of the commands to make it easier to make it do what you want but the general run down is this.

use Instructions:
1) Just compile it the way it is and you'll get a thesis/dissertation that is in the format that BYU wants the final version to be.
2) I compiled this template on the EE Unix/Linux boxes, the CS Linux boxes, and my own machine (MikTeX with Windows XP) and I included the .sty sheets needed for it to compile in all those settings. Ideally, you would get rid of them and have all those packages in your install of LaTeX and you'd keep them up to date, but they're there so that it can compile right out of the door for everyone.
3) Since the Abstract and Acknowledgements need to be single spaced (and I couldn't figure out how to force it to skip even pages), you'll need to uncomment the \afterpage{\cleardoublepage} command in the abstract.tex and acknowledgements.tex files, if they are more than one page. If they're not then you'll need to be sure to have the singlepageabstract and/or singlepageacknowledgements options set to true, or else the top margin will not be correct.

Other Little Tips:
1) You'll need to set all of the name properties or you can make them use defaults (big ugly text that says it's missing) by using the option usedefaultnames.
2) The copyrightyear will just set itself to the current year, but you can change that if you want.
3) You can turn off any part of the BYU header using the commands in the \byustylesetup{} on line 36 through 46.
4) Let's say that you just want to print one chapter for some hard copy editing but you don't want to screw up all of the chapter numbers and bibTeX stuff, then you'll notice some commands on line 128 through 130. Those commands will make LaTeX only put that chapter in the generated document but leave all of the numbering and such untouched. You can also do multiple chapters by doing stuff like \includeonly{synchronization,results}. It's a nice little trick that I've really liked using.
5) You might have noticed the weird little comment at the bottom of master.tex ( %input "..\..\bib\refs.bib"), if you're using WinEdit (which I highly recommend) this tells it where your refs.bib is at and then you can just type in \cite{} and it will pop up a drop down list of all of your references. It's a nice little feature and helps avoid the ?'s from when you misspell a citation.

Printing Tips:
1) When you print your PDF make sure that "Page Scaling" is set to "None". The default value is "Fit to Printer Margins" and this will cause everything to be not quite the right size.
2) Also, check to make sure that your document is the right size (8.5" x 11"). It has been discovered that several LaTeX installation's default to generating a document that is on A4 paper and this will cause your margins to be off throughout your document when you print. To fix this follow these steps (with MikTeX):
	2a) Go to the "dvipdfm\config" folder in your MikTeX installation ("C:\texmf" by default) and edit the "config" file in a text editor
	2b) Change "p a4" to "p letter"

	2c) Go to the "dvips\config" folder in your MikTeX installation ("C:\texmf" by default) and edit the "config.ps" file in a text editor
	2d) Make sure that "letterSize" is the first entry in the list of paper sizes by changing the order from

        @ A4size 594.99bp 841.99bp
       	@+ ! %%DocumentPaperSizes: a4
        @+ %%PaperSize: A4

        @ letterSize 8.5in 11in
        @+ ! %%DocumentPaperSizes: Letter

	to

	@ letterSize 8.5in 11in
        @+ ! %%DocumentPaperSizes: Letter

        @ A4size 594.99bp 841.99bp
        @+ ! %%DocumentPaperSizes: a4
        @+ %%PaperSize: A4
	

To do:
For anyone that feels like playing around with this or who is a LaTeX master, I tried to get all of the \showBYUHeader stuff in \AtBeginDocument but I couldn't get it to work. It would be nice if someone could figure out how to do that, because then the header include would just be automatic from using the package.

Hopefully, this will help stop people from pulling out as many hairs as I have.
Dave Johansen
davejohansen@gmail.com

------------------
28 Nov 2007:
Corrections by Kent Layton:

master.tex- 1-forced the default for pdf links to have no border colors (it
was defaulting to a red box around every link in the pdf document).  2- Moved
the appendices after the bibliography.  3- Corrected the bibliography link (it
was pointing to the last page of the bibliography).

byustyle.sty- 1- Added a pdf bookmark for the Title Page.  2- Defined the
subsubsection function  (it defaults to a large font section with no
indentation for the first paragraph if it isn't defined).  3- relaxed
tolerances in the List of Figures to deal with long figure captions.

abstract.tex- 1. Added a comment line at the end of the file.  This is
necessary to cause a blank page with the \afterpage{clearpage} command if the
abstract is only one paragraph but extends to a second page.

