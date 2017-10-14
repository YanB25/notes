##汇编技巧
###循环转化
对于
``` c
for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
        // code here
    }
}
```
可以转化成
``` x86asm
# $t1 for i and $t2 for j
    move $t3, n
    move #t4, m
    move $t1, $zero
outer:
    move $t2, $zero
inner:
    # codes here
    addi $t2, $t2, 1
test:
    bnez $t2, $t4, inner
    addi $t1, $t1, 1
    bnez $t1, $t3, outer
end:
```
使用`do while`方式编写汇编代码比较简洁
注意跳出的条件判断在末尾
自增后`nez`就向前跳转
跳转后往下执行时自动把内层循环的`counter`置为零