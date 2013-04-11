all:
	apertium-validate-dictionary apertium-hbs-rus.hbs-rus.dix
	lt-comp lr apertium-hbs-rus.hbs-rus.dix hbs-rus.autobil.bin
	lt-comp rl apertium-hbs-rus.hbs-rus.dix rus-hbs.autobil.bin
	apertium-validate-dictionary apertium-hbs-rus.rus.dix
	lt-comp lr apertium-hbs-rus.rus.dix rus-hbs.automorf.bin apertium-hbs-rus.rus.acx
	lt-comp rl apertium-hbs-rus.rus.dix hbs-rus.autogen.bin
	cg-comp apertium-hbs-rus.rus-hbs.rlx rus-hbs.rlx.bin
	lrx-comp apertium-hbs-rus.rus-hbs.lrx rus-hbs.autolex.bin
	apertium-preprocess-transfer apertium-hbs-rus.rus-hbs.t1x rus-hbs.t1x.bin
	apertium-preprocess-transfer apertium-hbs-rus.rus-hbs.t1x rus-hbs.t2x.bin
	apertium-preprocess-transfer apertium-hbs-rus.rus-hbs.t3x rus-hbs.t3x.bin
	lt-comp lr apertium-hbs-rus.post-hbs.dix rus-hbs.autopgen.bin
	apertium-gen-modes modes.xml
