all: README.html Zsh-Native-Scripting-Handbook.html Zsh-Plugin-Standard.html

README.html: README.adoc
	asciidoctor README.adoc

Zsh-Native-Scripting-Handbook.html: Zsh-Native-Scripting-Handbook.adoc
	asciidoctor Zsh-Native-Scripting-Handbook.adoc

Zsh-Plugin-Standard.html: Zsh-Plugin-Standard.adoc
	asciidoctor Zsh-Plugin-Standard.adoc

gh-pages:
	@mkdir -p ~/tmp/znsh
	@mv -v *.html ~/tmp/znsh
	git checkout gh-pages
	@cp -v ~/tmp/znsh/*.html .

master:
	git reset --hard
	git checkout master
	make all

loop:
	while true; do make all >/dev/null 2>&1; sleep 1; done
