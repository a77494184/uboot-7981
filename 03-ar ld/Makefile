all:libexample.a libexample.so main.static main.shared 

CFLAGS = -I./include -fPIC
LDFLAGS = -L. -L./lib -lexample

example.o:example.c 
	$(CC) $(CFLAGS) -c $^ -o $@ 

libexample.a:example.o 
	$(AR) -cruv $@ $^

libexample.so:example.o
	$(LD) -shared $^ -o $@

main.static:main.o libexample.a 
	$(CC) $^ $(CFLAGS) -o $@
	
main.shared:main.o libexample.so
	$(CC) $< $(CFLAGS) $(LDFLAGS) -o $@

clean:
	@rm -rf *.o libexample.* main.shared main.static
