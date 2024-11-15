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
	# When including graphics in svg format using \includesvg,
	# add this to your root.tex file:
	# \usepackage[extractpath=out/svg-extract]{svg-extract}
	# This will generate the following directory with ready-to-upload pdf files.
	test -d "../out/svg-extract" && cp ../out/svg-extract/* figures
	for file in figures/*_svg-raw-extract.pdf; do mv "$$file" "$${file%_svg-raw-extract.pdf}.pdf"; done
	for file in figures/*_svg-tex-extract.pdf; do mv "$$file" "$${file%_svg-tex-extract.pdf}.pdf"; done
	sed -i 's/\\includesvg\[/\\includegraphics\[/g' root.tex

archive:
	zip -r arxiv.zip * -x *.zip Makefile
