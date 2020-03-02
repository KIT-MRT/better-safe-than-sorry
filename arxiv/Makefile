all:
	make clean
	make latexbuild
	make copyfiles
	make archive

clean:
	ls | grep --invert-match -e Makefile -e .gitignore | xargs rm -rf
	cd .. && latexmk -C && rm -f root.bbl

latexbuild:
	cd .. && pwd && docker run --rm --volume "${CURDIR}/..":/workdir --workdir /workdir makisyu/texlive-2016 latexmk

copyfiles:
	cd .. && latexpand --empty-comments root.tex > arxiv/root.tex
	cp ../root.bbl .
	mkdir figures
	grep includegraphics root.tex | sed -r 's#[[:space:]]*\\includegraphics\[.*\]\{(.*)\}#\1#g' | xargs -I% cp ../%.pdf %.pdf

archive:
	zip -r arxiv.zip * -x *.zip Makefile
