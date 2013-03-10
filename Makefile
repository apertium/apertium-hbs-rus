all:
	apertium-validate-dictionary apertium-sh-ru.sh-ru.dix
	lt-comp lr apertium-sh-ru.sh-ru.dix sh-ru.autobil.bin
	lt-comp rl apertium-sh-ru.sh-ru.dix ru-sh.autobil.bin
	apertium-validate-dictionary apertium-sh-ru.ru.dix
	lt-comp lr apertium-sh-ru.ru.dix ru-sh.automorf.bin apertium-sh-ru.ru.acx
	lt-comp rl apertium-sh-ru.ru.dix sh-ru.autogen.bin
	cg-comp apertium-sh-ru.ru-sh.rlx ru-sh.rlx.bin
	lrx-comp apertium-sh-ru.ru-sh.lrx ru-sh.autolex.bin
	apertium-preprocess-transfer apertium-sh-ru.ru-sh.t1x ru-sh.t1x.bin
	apertium-preprocess-transfer apertium-sh-ru.ru-sh.t1x ru-sh.t2x.bin
	apertium-preprocess-transfer apertium-sh-ru.ru-sh.t3x ru-sh.t3x.bin
	lt-comp lr apertium-sh-ru.post-sh.dix ru-sh.autopgen.bin
	apertium-gen-modes modes.xml
