all:
	make clean
	make latexbuild
	make copyfiles
	make archive

clean:
	rm -fr root.tex root.bbl figures biblatex arxiv.zip

latexbuild:
	cd .. && pwd && docker run --rm --volume ${CURDIR}/..:/workdir --workdir /workdir makisyu/texlive-2016 latexmk

copyfiles:
	cd .. && latexpand --empty-comments root.tex > arxiv/root.tex
	cp ../root.bbl .
	mkdir figures
	grep includegraphics root.tex | sed -r 's#[[:space:]]*\\includegraphics\[.*\]\{(.*)\}#\1#g' | xargs -I% cp ../%.pdf %.pdf

archive:
	zip -r arxiv.zip * -x *.zip Makefile
