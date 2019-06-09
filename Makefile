
vpath %.c src
vpath %.h include

CP       = cp -f -u
RM       = rm -f

CC       = gcc
CFLAGS   = -std=c17 -Wall -Wextra -Wpedantic -O3 -mtune=intel -march=skylake
CPPFLAGS = -D_POSIX_C_SOURCE -D_GNU_SOURCE
LDFLAGS  = -lm -lgmp

TARGET   = bin2dec

all: $(TARGET)

$(TARGET): main.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include -o $@ $^ $(LDFLAGS)

main.o: main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include -c -o $@ $^

.PHONY: clean
clean:
	$(RM) ./*.{o,asm,lst} $(TARGET)

.PHONY: install
install: $(TARGET)
	$(CP) ./$(TARGET) /usr/bin

.PHONY: uninstall
uninstall:
	$(RM) /usr/bin/$(TARGET)

