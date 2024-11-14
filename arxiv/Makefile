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
	grep -E "includegraphics\[?.*\]?{[^}]+}" root.tex | `# Extract all \includegraphics commands from the root.tex file.` \
		sed -r 's#.*\\includegraphics[^{]*\{([^}]*)\}.*#\1#g' | `# Extracts the file path from the \includegraphics command.` \
		xargs -I% find ../figures -regextype sed -regex "../%\(\.pdf\|\.png\|\.jpg\|\.jpeg\)\?" | `# Finds the file path in the figures directory.` \
		xargs -I% cp % figures `# Copy the file to the figures directory.`

archive:
	zip -r arxiv.zip * -x *.zip Makefile
