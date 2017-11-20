docco:
	docco index.md -o docs/ -l linear
	
	docco forte1967/index.md -o docs/forte1967/ -l linear
	docco forte1967/*.sno -o docs/forte1967/ -l linear -e .lisp

	docco griswold-poage-polonsky1971/index.md -o docs/griswold-poage-polonsky1971/ -l linear
	docco griswold-poage-polonsky1971/*.sno -o docs/griswold-poage-polonsky1971/ -l linear -e .lisp

doc:
	rm -r -f docs/index.html docs/forte1967 docs/griswold-poage-polonsky1971
	cd forte1967/; ./idx.sh
	cd griswold-poage-polonsky1971/; ./idx.sh
	make docco
