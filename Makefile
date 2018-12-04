output	= NET.rom

AS	= pasmo
ASFLAGS	= --alocal
OFLAG	=

all: $(output)

.SUFFIXES: .rom .asm

.asm.rom:
	$(AS) $(ASFLAGS) $^ $(OFLAG) $@

.PHONY: all clean

clean:
	$(RM) $(output)
