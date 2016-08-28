
DISTDIR   = dist
STATICDIR = static

# Static files, e.g. the readme.txt file, that get copied straight to
# the dist directory.
STATIC    = $(shell find $(STATICDIR) -name "*.*" -not -name ".*" 2> /dev/null)
STATICDEST= $(subst $(STATICDIR),$(DISTDIR),$(STATIC))

.PHONY: copy
default: copy

${STATICDEST}:
	@mkdir -p $(shell dirname $@)
	cp $(subst $(DISTDIR),$(STATICDIR),$@) $@

copy: ${STATICDEST}

clean:
	rm -rf ${DISTDIR}
