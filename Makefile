# Arquivo Makefile para automaticamente chamar o BiBTeX e o LaTeX
# no número de vezes mais comumente utilizado.  Se você desejar
# algo mais robusto, posso recomendar o latexmk [1].
#
# Para usar, basta executar:
#
#     make
#
# dentro do diretório da monografia.  Se o LaTeX estiver
# emperrado, você pode tentar limpar seus arquivos auxiliares
# usando:
#
#     make clean
#
# [1] http://www.phys.psu.edu/~collins/software/latexmk/

default: pdf

pdf:
	pdflatex monografia.tex
	bibtex monografia
	pdflatex monografia.tex
	pdflatex monografia.tex

ps: dvi
	dvips monografia.dvi

dvi:
	latex monografia.tex
	bibtex monografia
	latex monografia.tex
	latex monografia.tex

clean:
	rm -vf monografia.{aux,bbl,blg,brf,fdb_latexmk,lof,log,lot,out,toc}

mrproper: clean
	rm -vf monografia.{dvi,pdf,ps}