doc: xxint/xxint.hxx
	doxygen

read_asm: test/read_asm.s

CXXFLAGS = --std=c++14 -O2 -I.

%.s: %.cpp
	$(CXX) -o $@ -S $< $(CXXFLAGS)

upload-doc:
	make doc
	ghp-import -n doc/html
	git push -f https://github.com/tov/xxint.git gh-pages
