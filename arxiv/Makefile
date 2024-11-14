all:
	make clean
	make latexbuild
	make copyfiles
	make archive

clean:
	ls | grep --invert-match -e Makefile -e .gitignore | xargs rm -rf
	cd .. && latexmk -C && rm -f root.bbl

latexbuild:
	cd .. && pwd && docker run --rm --user $(id -u):$(id -g) --volume .:/workdir --workdir /workdir makisyu/texlive-2020 latexmk

copyfiles:
	cd .. && latexpand --empty-comments root.tex > arxiv/root.tex
	cd .. && cp root.bbl ieeeconf.cls arxiv
	mkdir figures
	grep -E "includegraphics\[?.*\]?{[^}]+}" root.tex | sed -r 's#.*\\includegraphics[^{]*\{([^}]*)\}.*#\1#g' | xargs -I% find ../figures -regextype sed -regex "../figures/%\(\.pdf\|\.png\|\.jpg\|\.jpeg\)\?" | xargs -I% cp % figures

archive:
	zip -r arxiv.zip * -x *.zip Makefile
