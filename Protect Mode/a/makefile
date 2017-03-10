src = pmtest1.asm
boot = boot.bin

$(boot):$(src)
	nasm $(src) -o $(boot)

write:$(boot)
	dd if=$(boot) of=a.img bs=512 count=1 conv=notrunc

run-debug:write
	bochs -f bochsrc

run:write
	qemu-system-i386 -fda a.img

clean:
	-rm -f $(boot)
