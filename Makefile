
DISTDIR   = dist
STATICDIR = static

# Static files, e.g. the readme.txt file, that get copied straight to
# the dist directory.
STATIC    = $(shell find $(STATICDIR) -name "*.*" -not -name ".*" 2> /dev/null)
STATICDEST= $(subst $(STATICDIR),$(DISTDIR),$(STATIC))

$(warning $(STATIC))
$(warning $(STATICDEST))

.PHONY: copy
default: copy

${STATICDEST}: ${STATIC}
	@mkdir -p $(shell dirname $@)
	cp $< $@

copy: ${STATICDEST}

clean:
	rm -rf ${DISTDIR}
