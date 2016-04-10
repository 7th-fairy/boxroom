.SUFFIXES: .toc .cpp
.toc.cpp:
	@toc $^
	@echo make: '$@' is maked.

.SUFFIXES: .cpp .obj
.cpp.obj:
	@cl $^ /c /nologo
	@echo make: '$@' is maked.

.SUFFIXES: .toc .h
.toc.h:
	@toc $^
	@echo make: '$@' is maked.

tocfiles:=$(wildcard *.toc)
objfiles=$(tocfiles:.toc=.obj)

boxroom.lib: $(wildcard *.h) $(objfiles)
	@lib $(objfiles) \
	/out:$@ /nologo
	@echo make: '$@' is maked.
