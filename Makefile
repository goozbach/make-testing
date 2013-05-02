.PHONY: all
all: bar/bar_0.0.1.tar.gz foo/foo_0.0.1.tar.gz

bar/bar_0.0.1.tar.gz: $(shell find bar/bar_0.0.1)
	@echo -e "BAR\n===="
	@echo lt: $<
	@echo at: $@
	@echo qm: $?
	@echo

FOODIR = $(wildcard foo/*_0.0.1)
FOOTAR = $(patsubst %,%.tar.gz,$(FOODIR))

.SECONDEXPANSION:
$(FOOTAR): $$(shell find $$(patsubst %.tar.gz,%,$$@))
	@echo -e "FOO\n===="
	@echo lt: $<
	@echo at: $@
	@echo qm: $?
	@echo

