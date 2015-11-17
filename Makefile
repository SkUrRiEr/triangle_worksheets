KEYS = 13
LENGTHS = 4 5

check: $(addprefix check_, $(LENGTHS))

check_%: triangle_worksheet_%.txt
	test $$(sed 's/\[/\n\[/g' < $^ | grep -F "[" | wc -l) -eq $$(php calc_count.php $(KEYS) $*)

