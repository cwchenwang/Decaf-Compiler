1. 类的浅复制
- 修改了`Parser.y`：增加了对ident和expr的定位
- 修改了`Tree.java`：修改了Scopy函数，增加了ident和expr的Location
- 修改了`TypeCheck.java`：增加了`visitScopy`函数，实现了对scopy类型的报错

2. sealed的支持
- 修改了`Class.java`：增加了sealed属性
- 修改了`BuildSym.java`：在visitClassDef中设置进行判断，设置sealed为true或false
- 修改了`TypeCheck.java`：在visitClassDef中进行判断，如果父亲是sealed，报错

4.
- `BaseType.java`中添加UNKNOWN基本类型