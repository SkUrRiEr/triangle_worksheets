KEYS = 13
LENGTHS = 4 5 6

all: $(addsuffix .txt, $(addprefix triangle_worksheet_, $(LENGTHS))) check
.PHONY: all

check: $(addprefix check_, $(LENGTHS))
.PHONY: check

check_%: triangle_worksheet_%.txt calc_count.sh
	test $$(sed 's/\[/\n\[/g' < $< | grep -F "[" | wc -l) -eq $$(./calc_count.sh $(KEYS) $*)
.PHONY: check_%

triangle_worksheet_%.txt: gen_worksheet.sh
	./gen_worksheet.sh $(KEYS) $* > $@
