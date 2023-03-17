template_robomech.pdf: template_robomech.dvi
	dvipdfmx -p a4 -f font.map template_robomech.dvi

template_robomech.dvi: *.tex
	sed -e 's/。/．/g' -e 's/、/，/g' template_robomech.tex > tmp.tex
	platex tmp.tex
	# pbibtex tmp.aux
	platex tmp.tex
	platex tmp.tex
	platex tmp.tex
	mv tmp.dvi template_robomech.dvi

clean:
	rm -f *.aux *.log *.dvi *.bbl *.blg *.ilg *.idx *.toc *.ind tmp.*
