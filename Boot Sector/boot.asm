    org 07c00h
    mov ax, cs
    mov ds, ax
    mov es, ax
    call DispStr ;show a string
    jmp $  ;loop

DispStr:
    mov ax, BootMessage
    mov bp, ax ; ES:BP = 串地址
    mov cx, 16 ; cx = 串长度
    mov ax, 01301h ; ah = 13, al = 01h
    mov bx, 000ch  ; 页号为0(bh = 0) 黑底红字(bl = 0ch, 高亮)
    mov dl, 0
    int 10h
    ret

BootMessage: 
    db "hhhhhhhhh hi"
    
    times 510 - ($-$$) db 0
    dw 0xaa55
