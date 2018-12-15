<h1 style="text-align:center">Decaf PA2 Report</h1>

<center>王琛 计65 2016011360</center>

### 一、特性的增加

#### 3. 串行条件卫士语句

- `TransPass2.java`：

  - 增加`visitIfSub`函数：对串行条件卫士单条语句的处理。首先访问Expr，其次生成条件转移的三地址码，然后是条件为真的部分，直接accept即可，最后调用genMark（条件为假转移到的地方）。



#### 4. 简单的类型推导

- `Tree.java`：在Lvalue的Kind的中新增了AUTO_VAR类型，用于自动推导的情况

- `TypeCheck.java`：在visitIdent中判断为var时，将lvKind设置为AUTO_VAR

- `TransPass2.java`：

    - 在visitIdent函数中新增AUTO_VAR的情况，设置其symbol对应的Temp对象

    - 在visitAssign函数中新增了对AUTO_VAR情况的处理。和LOCAL_VAR相同，将assign.left（实际上是Tree.Ident类型）的Temp和assign.expr.val作为参数调用genAssign生成三地址码


#### 5. 若干与一维数组有关的表达式或语句

##### （1） 数组初始化常量表达式

- `TransPass2.java`：增加了visitArrayRepeat函数，如果不是class类型，直接调用genNewArray生成，如果是class类型 //TODO

- `Translater.java`：

  - 修改了`genCheckNewArraySize`，添加了参数int opt。如果opt为1则报数组初始化n取值小于0的错，否则和之前一样报NEGATIVE_ARRAY_SIZE的错、
  - 修改了`genNewArray`函数：添加了Temp value和int opt参数，其中value用来是数组初始化的值，正常情况下为0，当适用E%%n时值为E的值，opt含义和上面的genCheckNewArraySize相同。

#### “除零非法”检测

`Translater.java`：

- 增加了`genCheckDivByZero`，参数为除数，如果除数为0，则报错并且停机，否则直接退出。（写法和`genCheckNewArraySize`基本相同）。
- 在`genMul`和`genMod`调用上述函数进行判断。