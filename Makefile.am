VERSION=0.5.0
LANG1=hbs
LANG1a=hbs_BS
LANG1b=hbs_HR
LANG1c=hbs_SR
LANG2=rus
VAR1=ijek
VAR2=ek
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)
PREFIX2a=$(LANG2)-$(LANG1a)
PREFIX2b=$(LANG2)-$(LANG1b)
PREFIX2c=$(LANG2)-$(LANG1c)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON = $(BASENAME).$(LANG1a).dix  $(BASENAME).$(LANG1b).dix $(BASENAME).$(LANG1c).dix \
	$(PREFIX2a).autogen.bin $(PREFIX2b).autogen.bin $(PREFIX2c).autogen.bin \
	$(BASENAME).$(LANG1).dix $(PREFIX1).rlx.bin $(PREFIX1).autolex.bin \
	$(PREFIX2).rlx.bin \
	$(PREFIX2a).autolex.bin \
	$(PREFIX2b).autolex.bin \
	$(PREFIX2c).autolex.bin \
	$(PREFIX1).automorf.bin $(PREFIX1).autobil.bin $(PREFIX1).autogen.bin \
	$(PREFIX2).automorf.bin $(PREFIX2).autobil.bin \
	$(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
	$(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin modes \
	$(PREFIX1).autopgen.bin $(PREFIX2a).autopgen.bin $(PREFIX2b).autopgen.bin $(PREFIX2c).autopgen.bin

#    $(PREFIX1).autopgen.bin $(PREFIX2).autopgen.bin 

$(BASENAME).$(LANG1a).dix: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix >$@

$(PREFIX2a).autogen.bin: $(BASENAME).$(LANG1a).dix
#	apertium-validate-dictionary $(BASENAME).$(LANG1a).dix
	lt-comp rl $(BASENAME).$(LANG1a).dix $@

$(BASENAME).$(LANG1b).dix: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix >$@

$(PREFIX2b).autogen.bin: $(BASENAME).$(LANG1b).dix
#	apertium-validate-dictionary $(BASENAME).$(LANG1b).dix
	lt-comp rl $(BASENAME).$(LANG1b).dix $@

$(BASENAME).$(LANG1c).dix: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR1) alt.xsl $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix >$@

$(PREFIX2c).autogen.bin: $(BASENAME).$(LANG1c).dix
#	apertium-validate-dictionary $(BASENAME).$(LANG1c).dix
	lt-comp rl $(BASENAME).$(LANG1c).dix $@

$(PREFIX2a).autolex.bin: $(BASENAME).$(PREFIX2a).lrx
	lrx-comp $(BASENAME).$(PREFIX2a).lrx $@

$(PREFIX2b).autolex.bin: $(BASENAME).$(PREFIX2b).lrx
	lrx-comp $(BASENAME).$(PREFIX2b).lrx $@

$(PREFIX2c).autolex.bin: $(BASENAME).$(PREFIX2c).lrx
	lrx-comp $(BASENAME).$(PREFIX2c).lrx $@


$(BASENAME).$(LANG1).dix: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1) --stringparam var $(VAR1) alt.xsl $(AP_SRC1)/apertium-$(LANG1).$(LANG1).metadix >$@ 

$(PREFIX1).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1).autobil.bin
	lt-trim $^ $@

$(PREFIX1).autogen.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).dix
#	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFIX1).rlx.bin: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).rlx
	cg-comp $< $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).rlx
	cg-comp $< $@

$(PREFIX1).prob: $(AP_SRC1)/$(LANG1).prob
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@

$(PREFIX1).autolex.bin: $(BASENAME).$(PREFIX1).lrx
	lrx-comp $(BASENAME).$(PREFIX1).lrx $@

$(PREFIX2a).autopgen.bin: $(AP_SRC1)/apertium-$(LANG1).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $< >.deps/post-$(LANG1a).dix
	apertium-validate-dictionary .deps/post-$(LANG1a).dix
	lt-comp lr .deps/post-$(LANG1a).dix $@ 

$(PREFIX2b).autopgen.bin: $(AP_SRC1)/apertium-$(LANG1).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $< >.deps/post-$(LANG1b).dix
	apertium-validate-dictionary .deps/post-$(LANG1b).dix
	lt-comp lr .deps/post-$(LANG1b).dix $@ 

$(PREFIX2c).autopgen.bin: $(AP_SRC1)/apertium-$(LANG1).post-$(LANG1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR1) alt.xsl $< >.deps/post-$(LANG1c).dix
	apertium-validate-dictionary .deps/post-$(LANG1c).dix
	lt-comp lr .deps/post-$(LANG1c).dix $@ 

$(PREFIX2).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2).autobil.bin
	lt-trim $^ $@

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp lr $(BASENAME).$(PREFIX1).dix $@

$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp rl $(BASENAME).$(PREFIX1).dix $@

$(PREFIX1).autopgen.bin: $(AP_SRC2)/apertium-$(LANG2).post-$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

#
#	TRANSFER
#

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX2).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t1x $@

$(PREFIX2).t2x.bin: $(BASENAME).$(PREFIX2).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX2).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t2x $@

$(PREFIX2).t3x.bin: $(BASENAME).$(PREFIX2).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX2).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t3x $@


EXTRA_DIST=$(BASENAME).$(PREFIX1).dix \
           $(BASENAME).$(LANG2).dix $(BASENAME).$(LANG1).tsx \
           $(BASENAME).$(LANG2).tsx  \
           $(PREFIX1).prob $(PREFIX2).prob \
           $(BASENAME).$(PREFIX1).lrx $(BASENAME).$(PREFIX2a).lrx $(BASENAME).$(PREFIX2b).lrx $(BASENAME).$(PREFIX2c).lrx \
           $(BASENAME).$(PREFIX1).rlx $(BASENAME).$(PREFIX2).rlx \
           $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x \
           $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t1x \
           $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x \
           alt.xsl \
           modes.xml

#           $(LANG1)-tagger-data/README $(LANG2)-tagger-data/README 

$(PREFIX1).mode: modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

$(PREFIX2a).mode: modes.xml 
	apertium-gen-modes modes.xml
	cp *.mode modes/

$(PREFIX2b).mode: modes.xml 
	apertium-gen-modes modes.xml
	cp *.mode modes/

$(PREFIX2c).mode: modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

modes: $(PREFIX1).mode

apertium_hbs_rusmodesdir=$(prefix)/share/apertium/modes/
apertium_hbs_rusdir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_hbs_rus_DATA=$(PREFIX1).automorf.bin $(PREFIX2).automorf.bin \
		    $(PREFIX2a).autogen.bin $(PREFIX2b).autogen.bin $(PREFIX2c).autogen.bin \
                    $(PREFIX1).autobil.bin $(PREFIX2).autobil.bin \
                    $(PREFIX1).autogen.bin \
                    $(PREFIX1).rlx.bin \
                    $(PREFIX2).rlx.bin \
                    $(PREFIX2a).autolex.bin \
                    $(PREFIX2b).autolex.bin \
                    $(PREFIX2c).autolex.bin \
                    $(PREFIX1).autolex.bin \
                    $(PREFIX1).prob $(PREFIX2).prob \
		    $(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
		    $(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin \
		    $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x $(BASENAME).$(PREFIX1).t3x\
		    $(BASENAME).$(PREFIX2).t1x $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x\
		    $(PREFIX2a).autopgen.bin \
		    $(PREFIX2b).autopgen.bin \
		    $(PREFIX2c).autopgen.bin \
		    $(PREFIX1).autopgen.bin \
		    $(PREFIX1).mode $(PREFIX2a).mode $(PREFIX2b).mode $(PREFIX2c).mode

#                    $(PREFIX1).autopgen.bin 
 #                   $(PREFIX2).autopgen.bin 
# 		     $(PREFIX2).autogen.bin 

install-data-local:
	$(prefix)/bin/apertium-gen-modes modes.xml apertium-$(PREFIX1)
	test -d $(DESTDIR)$(apertium_hbs_rusmodesdir) || mkdir $(DESTDIR)$(apertium_hbs_rusmodesdir)
	$(INSTALL_DATA) $(PREFIX1).mode $(DESTDIR)$(apertium_hbs_rusmodesdir)
	$(INSTALL_DATA) $(PREFIX2a).mode $(DESTDIR)$(apertium_hbs_rusmodesdir)
	$(INSTALL_DATA) $(PREFIX2b).mode $(DESTDIR)$(apertium_hbs_rusmodesdir)
	$(INSTALL_DATA) $(PREFIX2c).mode $(DESTDIR)$(apertium_hbs_rusmodesdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX2).t1x $(DESTDIR)$(apertium_hbs_rusdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t2x $(BASENAME).$(PREFIX2).t2x $(DESTDIR)$(apertium_hbs_rusdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t3x $(DESTDIR)$(apertium_hbs_rusdir)

CLEANFILES = -r $(TARGETS_COMMON) *.mode 
