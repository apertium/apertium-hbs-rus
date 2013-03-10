all:
	apertium-validate-dictionary apertium-bhs-rus.bhs-rus.dix
	lt-comp lr apertium-bhs-rus.bhs-rus.dix bhs-rus.autobil.bin
	lt-comp rl apertium-bhs-rus.bhs-rus.dix rus-bhs.autobil.bin
	apertium-validate-dictionary apertium-bhs-rus.rus.dix
	lt-comp lr apertium-bhs-rus.rus.dix rus-bhs.automorf.bin apertium-bhs-rus.rus.acx
	lt-comp rl apertium-bhs-rus.rus.dix bhs-rus.autogen.bin
	cg-comp apertium-bhs-rus.rus-bhs.rlx rus-bhs.rlx.bin
	lrx-comp apertium-bhs-rus.rus-bhs.lrx rus-bhs.autolex.bin
	apertium-preprocess-transfer apertium-bhs-rus.rus-bhs.t1x rus-bhs.t1x.bin
	apertium-preprocess-transfer apertium-bhs-rus.rus-bhs.t1x rus-bhs.t2x.bin
	apertium-preprocess-transfer apertium-bhs-rus.rus-bhs.t3x rus-bhs.t3x.bin
	lt-comp lr apertium-bhs-rus.post-bhs.dix rus-bhs.autopgen.bin
	apertium-gen-modes modes.xml
