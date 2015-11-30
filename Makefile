KEYS = 13
LENGTHS = 4 5 6

check: $(addprefix check_, $(LENGTHS))
.PHONY: check

check_%: triangle_worksheet_%.txt calc_count.sh
	test $$(sed 's/\[/\n\[/g' < $< | grep -F "[" | wc -l) -eq $$(./calc_count.sh $(KEYS) $*)
.PHONY: check_%

