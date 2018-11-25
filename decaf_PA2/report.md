<h1 style="text-align:center">Decaf PA2 Report</h1>

<center>王琛 计65 2016011360</center>

### 1. 类的浅复制

- 修改了`Parser.y`：增加了对ident和expr的定位

- 修改了`Tree.java`：修改了Scopy函数，增加了ident和expr的Location

- 修改了`TypeCheck.java`：增加了`visitScopy`函数。对于`scopy(ident, E)`，首先判断ident是否已经定义，如果没有定义先报错，否则检查ident是否为class类型，不是则报错，再判断E是否为class类型；如果ident是class类型，直接检查ident和E的类型是否相同，不同则报错。


### 2. sealed的支持

- 修改了`Class.java`：增加了sealed属性，用于判断该类是否为sealed
- 修改了`BuildSym.java`：由于`tree.java`中的`ClassDef`包含了sealed的boolean类型，所以在第一遍扫描时利用此sealed进行判断，修改Class.java中的sealed值
- 修改了`TypeCheck.java`：在visitClassDef中进行判断，如果父亲是sealed，报错即可



### 3. 支持串行条件卫士

- 修改了`TypeCheck.java`：

  - 增加了`visitIfSub`，对某个表达式的类型判断是否为bool的兼容型

  - 增加了`visitGuarded`，遍历每个条件语句，去调用`visitIfSub`函数


### 4. 支持简单的类型推导

- `BaseType.java`：添加UNKNOWN基本类型

- `BuildSym.java`：

  - 由于`Tree.java`是通过ident中isVar类型判断是否为var的，因此需要在建立符号表时添加`visitIdent`判断是否为var，如果是，将ident的类型设置为UNKNOWN
  - 添加了`visitAssign`对var对象检测类型冲突，这部分代码和`visitVarDef`基本相同

- `TypeCheck.java`：

  - 修改了`visitIdent`函数，在函数开始添加了判断ident是否为var，如果是直接返回，不进行后续处理
  - 在`visitAssign`中添加对var的类型推导


### 5. 支持下列数组操作

#### （1）数组初始化常量表达式  

- `TypeCheck.java`:
  - 增加`visitArrayRepeat`函数，对于`E%%n`，首先判断E是否为数组类型，不是则报错，然后判断n是否为int型，进行相应报错处理；如果出现错误返回错误类型，否则返回E的类型

#### （2） 数组动态下标访问表达式

E[E1] default E'

- `TypeCheck.java`:
  - 增加`visitDefault`函数，如果E是数组类型，检查E1是否为int型，然后检查E和E'元素类型是否相同，进行相应的报错，返回E的元素类型；如果E不是数组类型，检查E'是否为合法的数组元素，如果合法返回其类型，否则返回错误类型

#### （3）数组迭代语句

- `Symbol.java`：添加setType函数，设置符号的类型
- `BuildSym.java`：
  - 添加`visitBoundedVariable`：如果是var，将类型设置为UNKNOWN
  - 增加`visitForeach`：判断Stmt是否为Block，如果是Block，直接使用这个Block，如果不是，利用该Stmt新建一个Block，得到Block后，创建一个作用域，构建符号表

- `TypeCheck.java`：
  - 添加`visitForeach`：如果是var x，判断E是否为合法的数组类型，如果不是报错后直接返回，否则将var的类型设置为E的元素类型，如果是Type x，判断x和E的元素类型是否兼容，不是则报错。根据推断得到的var类型，修改符号表中的变量类型。



## Acknowledgement

本次实验柳瑞阳同学和李依林同学曾给予我指导，并且我还与李映辉同学进行过交流。