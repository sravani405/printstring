ALL_TARGETS += $(o)tools/example
CLEAN_TARGETS += clean-tools
INSTALL_TARGETS += install-tools

example_SOURCES := tools/example.c
example_OBJECTS := $(addprefix $(o),$(example_SOURCES:.c=.o))


$(o)tools/%.o: tools/%.c
	$(call compile_tgt,tools)

$(o)tools/example: $(example_OBJECTS) $(o)src/libdll.a
	$(call link_tgt,tools)


clean-tools:
	rm -f $(example_OBJECTS) \
		$(o)tools/example

install-tools: $(o)tools/example
	$(INSTALL) -d -m 0755 $(DESTDIR)$(BINDIR)
	$(INSTALL) -m 0755 $(o)tools/example $(DESTDIR)$(BINDIR)/
