面向对象的特征
  封装,继承,多态

final, finally, finalize 的区别
  final修饰符（关键字）。被final修饰的类，就意味着不能再派生出新的子类，不能作为父类而被子类继承。因此一个类不能既被abstract声明，又被final声明。
将变量或方法声明为final，可以保证他们在使用的过程中不被修改。被声明为final的变量必须在声明时给出变量的初始值，而在以后的引用中只能读取。
被final声明的方法也同样只能使用，不能重载。

  finally是在异常处理时提供finally块来执行任何清除操作。不管有没有异常被抛出、捕获，finally块都会被执行。try块中的内容是在无异常时执行到结束。
catch块中的内容，是在try块内容发生catch所声明的异常时，跳转到catch块中执行。finally块则是无论异常是否发生，都会执行finally块的内容，所以在代码逻辑中有需要无论发生什么都必须执行的代码，
就可以放在finally块中。

  finalize是方法名。java技术允许使用finalize（）方法在垃圾收集器将对象从内存中清除出去之前做必要的清理工作。这个方法是由垃圾收集器在确定这个对象没有被引用时对这个对象调用的。它是在object类中定义的，因此所有的类都继承了它。
子类覆盖finalize（）方法以整理系统资源或者被执行其他清理工作。finalize（）方法是在垃圾收集器删除对象之前对这个对象调用的。

int 和 Integer 有什么区别
1，无论如何，Integer与new Integer不会相等。不会经历拆箱过程，new出来的对象存放在堆，而非new的Integer常量则在常量池（在方法区），他们的内存地址不一样，所以为false。

2，两个都是非new出来的Integer，如果数在-128到127之间，则是true,否则为false。因为java在编译Integer i2 = 128的时候,被翻译成：Integer i2 = Integer.valueOf(128);而valueOf()函数会对-128到127之间的数进行缓存。

3，两个都是new出来的,都为false。还是内存地址不一样。

4，int和Integer(无论new否)比，都为true，因为会把Integer自动拆箱为int再去比。

重载和重写的区别
  方法重载是指同一个类中的多个方法具有相同的名字,但这些方法具有不同的参数列表,即参数的数量或参数类型不能完全相同
  方法重写是存在子父类之间的,子类定义的方法与父类中的方法具有相同的方法名字,相同的参数表和相同的返回类型


抽象类和接口有什么区别
  1、抽象类和接口都不能直接实例化，如果要实例化，抽象类变量必须指向实现所有抽象方法的子类对象，接口变量必须指向实现所有接口方法的类对象。

  2、抽象类要被子类继承，接口要被类实现。

  3、接口只能做方法申明，抽象类中可以做方法申明，也可以做方法实现

  4、接口里定义的变量只能是公共的静态的常量，抽象类中的变量是普通变量。

  5、抽象类里的抽象方法必须全部被子类所实现，如果子类不能全部实现父类抽象方法，那么该子类只能是抽象类。同样，一个实现接口的时候，如不能全部实现接口方法，那么该类也只能为抽象类。

  6、抽象方法只能申明，不能实现，接口是设计的结果 ，抽象类是重构的结果

  7、抽象类里可以没有抽象方法

  8、如果一个类里有抽象方法，那么这个类只能是抽象类

  9、抽象方法要被实现，所以不能是静态的，也不能是私有的。

  10、接口可继承接口，并可多继承接口，但类只能单根继承。
说说反射的用途及实现
说说自定义注解的场景及实现
HTTP 请求的 GET 与 POST 方式的区别
session 与 cookie 区别
session 分布式处理
JDBC 流程
MVC 设计思想
equals 与 == 的区别
集合
List 和 Set 区别
List 和 Map 区别
Arraylist 与 LinkedList 区别
ArrayList 与 Vector 区别
HashMap 和 Hashtable 的区别
HashSet 和 HashMap 区别
HashMap 和 ConcurrentHashMap 的区别
HashMap 的工作原理及代码实现
ConcurrentHashMap 的工作原理及代码实现
线程
创建线程的方式及实现
sleep() 、join（）、yield（）有什么区别
说说 CountDownLatch 原理
说说 CyclicBarrier 原理
说说 Semaphore 原理
说说 Exchanger 原理
说说 CountDownLatch 与 CyclicBarrier 区别
ThreadLocal 原理分析
讲讲线程池的实现原理
线程池的几种方式
线程的生命周期
锁机制
说说线程安全问题
volatile 实现原理
synchronize 实现原理
synchronized 与 lock 的区别
CAS 乐观锁
ABA 问题
乐观锁的业务场景及实现方式