TARGET = kernel.elf
OBJS = main.o

CXXFLAGS += -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone \
            -fno-exceptions -fno-rtti -std=c++17
LDFLAGS  += --entry KernelMain -z norelro --image-base 0x100000 --static

CPPFLAGS += -I $(HOME)/osbook/devenv/x86_64-elf/include/c++/v1 -I \
			$(HOME)/osbook/devenv/x86_64-elf/include -nostdlibinc \
			-D__ELF__ -D_LDBL_EQ_DBL -D_GNU_SOURCE -D_POXIS_TIMERS

BASEENV = $(HOME)/osbook/devenv/buildenv.sh

.PHONY: all
all:
	. $(BASEENV)
	$(MAKE) $(TARGET)

.PHONY: clean
clean:
	rm -rf *.o

kernel.elf: $(OBJS) Makefile
	ld.lld-7 $(LDFLAGS) -o kernel.elf $(OBJS)

%.o: %.cpp Makefile
	clang++ $(CPPFLAGS) $(CXXFLAGS) -c $<
