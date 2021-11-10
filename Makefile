prog = main
dynamic_libs = one two
dep_libnames = $(addprefix lib,$(dynamic_libs))
dep_libfnames = $(addsuffix .so,$(dep_libnames))

CFLAGS ?= -Wall -Wextra
prog_ldflags = $(addprefix -l,$(dynamic_libs))

all: $(prog)

main.o: libone.h libtwo.h
libone.o: implementation.h libone.h
libtwo.o: implementation.h libtwo.h

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.so: %.o
	$(CC) $(LDFLAGS) -shared -o $@ $<

$(prog): main.o $(dep_libfnames)
	$(CC) $(LDFLAGS) $(prog_ldflags) -L. -o $@ $<

clean:
	$(RM) $(prog) $(dep_libfnames) *.o
