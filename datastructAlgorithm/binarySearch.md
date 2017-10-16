##二分搜索
二分搜索往往需要找到最左或最右的目标元素
这时算法应满足两个要求
1. 搜索区间必须严格递减
否则会导致无限递归（循环）
2. 正确性
###二分最左元素
``` cpp
int binarySearchL(int* arr, int beg, int end, int tar) {
    if (beg == end) return arr[beg] == tar ? beg : -1;
    int mid = (end + beg) / 2; //（1）
    if (arr[mid] < tar) {
        return binarySearchL(arr, mid + 1, end, tar);
    } else {
        return binarySearchL(arr, beg, mid, tar);
    }
}
```
将区间分为`[beg, end]`时，
`[0, beg)`都是`<target`的
`（end, size)`都是`>= target`的
当`[beg, end]`区域内所有元素都等于`target`时
应逐步让`end`向左靠拢
注意`(1)`注释，
在搜索最右元素时，应改为`(end + beg + 1) / 2`
以保证不发生无限递归
```cpp
int binarySearchR(int* arr, int beg, int end, int tar) {
    if (beg == end) return arr[beg] == tar ? beg : -1;
    int mid = (end + beg + 1)/2;
    if (arr[mid] > tar) {
        return binarySearchR(arr, beg, mid-1, tar);
    } else {
        return binarySearchR(arr, mid, end, tar); 
    }
}
```