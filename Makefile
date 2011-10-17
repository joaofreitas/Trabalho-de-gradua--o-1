# Arquivo Makefile para automaticamente chamar o BiBTeX e o LaTeX
# no número de vezes mais comumente utilizado.  Se você desejar
# algo mais robusto, posso recomendar o latexmk [1].
#
# Para usar, basta executar:
#
#     make
#
# dentro do diretório da artigo.  Se o LaTeX estiver
# emperrado, você pode tentar limpar seus arquivos auxiliares
# usando:
#
#     make clean
#
# [1] http://www.phys.psu.edu/~collins/software/latexmk/

default: pdf

pdf:
	pdflatex artigo.tex
	bibtex artigo
	pdflatex artigo.tex
	pdflatex artigo.tex

ps: dvi
	dvips artigo.dvi

dvi:
	latex artigo.tex
	bibtex artigo
	latex artigo.tex
	latex artigo.tex

clean:
	rm -vf artigo.{aux,bbl,blg,brf,fdb_latexmk,lof,log,lot,out,toc}

mrproper: clean
	rm -vf artigo.{dvi,pdf,ps}
