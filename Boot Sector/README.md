#引导扇区
我们知道,当计算机电源被打开时,它会先进行加电自检(POST),然后寻找启动盘,如果是选择从软盘启动,计算机就会检
查软盘的0面0磁道1扇区,如果发现它以0xAA55结束,则BIOS认为它是一个引导扇区。当然,一个正确的引导扇区除了以0xAA55
结束之外,还应该包含一段少于512字节的执行码。
一旦BIOS发现了引导扇区,就会将这512字节的内容装载到内存地址0000:7c00处,然后跳转到0000:7c00处将控制权彻底交给这段引导代码。到此为止,计算机不再由BIOS中固有的程序来控制,而变成由操作系统的一部分来控制。
代码的第一行“org0 7c00”这行代码就是告诉编译器,将来我们的这段程序要被加载到内存偏移地址0x7c00处。

#关于`$`和`$$`
`$`表示当前行被汇编后的地址。

`$$`表示一个节(section)的开始处被汇编后的地址。在这里,我们的程序只有1个节,所以,$$实际上就表示程序被编译后的开始地址,也就是0x7c00。

在写程序的过程中,`$-$$`可能会被经常用到,它表示本行距离程序开始处的相对距离。

`times 510-($-$$) db 0`表示将0这个字节重复`510-($-$$)`遍,也就是在剩下的空间中不停地填充0,直到程序有510字节为止。
这样,加上结束标志0xAA55占用的2字节,恰好是512字节。



