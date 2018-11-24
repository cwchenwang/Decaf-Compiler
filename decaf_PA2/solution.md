1. 类的浅复制
- 修改了`Parser.y`：增加了对ident和expr的定位
- 修改了`Tree.java`：修改了Scopy函数，增加了ident和expr的Location
- 修改了`TypeCheck.java`：增加了`visitScopy`函数，实现了对scopy类型的报错

2. sealed的支持
- 修改了`Class.java`：增加了sealed属性
- 修改了`BuildSym.java`：在visitClassDef中设置进行判断，设置sealed为true或false
- 修改了`TypeCheck.java`：在visitClassDef中进行判断，如果父亲是sealed，报错

3. 支持串行条件卫士
- 修改了`BuildSym.java`：增加了visitGuarded，遍历整个列表，增加了visitIfSub，对某个表达式的类型进行判断

4. 支持简单的类型推导
- `BaseType.java`中添加UNKNOWN基本类型
- `BuildSym.java`中添加visitIdent判断是否为var，添加了visitAssign对var对象设置类型
- `TypeCheck.java`在visitIdent中添加了对var的判断，在visitAssign中设置var类型

5. 支持下列数组操作
- 数组初始化常量表达式  
    - `TypeCheck.java`增加visitArrayRepeat函数，首先判断expr2是否为数组类型，再判断expr2是否为int类型，进行相应的报错
- 数组动态下标访问表达式