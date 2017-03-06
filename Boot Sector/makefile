src = boot.asm
boot = boot.bin

$(boot):$(src)
	nasm $(src) -o $(boot)

write:$(boot)
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc

run-debug:write
	bochs -f bochsrc

run:write
	qemu-system-i386 -fda $(boot)

clean:
	-rm -f $(boot)
