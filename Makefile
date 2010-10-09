
link:
	raco planet link samdphillips testy.plt 1 0 ./testy

unlink:
	raco planet unlink samdphillips testy.plt 1 0

create:
	raco planet create `pwd`/testy

inject:
	raco planet fileinject samdphillips testy.plt 1 0
	
remove:
	raco planet remove samdphillips testy.plt 1 0

