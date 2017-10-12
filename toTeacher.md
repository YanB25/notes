#解决了课本linkedList内存泄漏的问题
- - -
##代码
- 结论：是我自己的某处代码实现与课本不兼容

```cpp
//源代码如下,本处与课本代码完全一致
stack& stack::operator=(const stack& rhs) {
    Node* new_head = nullptr; // :new_top
    Node* cur = nullptr;  // :new_copy
    Node* rhs_cur = rhs.head_; //: top_node
    if (rhs_cur) {
        new_head = cur = new Node(rhs_cur->data);
        while (rhs_cur->next) {
            rhs_cur = rhs_cur->next;
            cur->next = new Node(rhs_cur->data);
            cur = cur->next;
        }
    }
    clear(); //TODO: notice here
    head_ = new_head;
    size_ =  rhs.size_;
    return (*this);
}

```
其中我的clear函数实现如下

```cpp
void stack::clear() {
    while (!empty()) {
        pop();
    }
}
```

```cpp
bool stack::empty() const { return size_ == 0; } //TODO: notice here
```
##分析
出错的核心原因是`operator=`函数没有保存源栈的`size`变量（即`rhs.size`)
第一段代码(`operator=`)中，clear函数会对原来的stack进行清空(`clear()`)
(见`notice here`注释)
清空后`this->size`的值会变为0
由于此处是`s=s`的自复制,实际上也修改了等号右侧变量的`rhs.size`
在 ```size = rhs.size``` 语句中
事实上把0赋给了`size`
于是在析构函数中，错误地认为了该栈已经被清空，不做`delete`操作
于是内存泄漏最终发生在析构函数中
但错误的代码却是不起眼的`empty()` 

课本对`linkedStack`和`linkedQueue`的实现都是残缺的。
没有给出`int size() const`和`bool empty() const`的实现。
(事实上课本似乎根本没有考虑过保留`size`变量)
而这些细节上的实现，也是需要花心思留意的。
我个人觉得，实现出完美的`operator=`的难度并不低。
##修改方式
###方式1
stack内不再保留size成员，把`size()` 实现为`O(n)`的方法即时求值
并修改以下代码
```cpp
bool stack::empty() const {
	return head_ == nullptr;
}
```
###方式2
将`operator=`修改为以下代码
```cpp
stack& stack::operator=(const stack& rhs) {
    Node* new_head = nullptr;
    Node* cur = nullptr; 
    Node* rhs_cur = rhs.head_;
    int rhs_size = rhs.size_; //notice here
    if (rhs_cur) {
        new_head = cur = new Node(rhs_cur->data);
        while (rhs_cur->next) {
            rhs_cur = rhs_cur->next;
            cur->next = new Node(rhs_cur->data);
            cur = cur->next;
        }
    }
    clear();
    head_ = new_head;
    size_ = rhs_size; //notice here 
    return (*this);
}

```
##结论
1. 开源的工具往往是可靠的
2. `operator=`对自赋值处理时，要把源变量的所有内容深复制到临时变量上。
2. 当你觉得是课本错的时候，往往是你太年轻...
3. 一个语句埋下的祸根，会在离它很远很远的语句上爆发


end