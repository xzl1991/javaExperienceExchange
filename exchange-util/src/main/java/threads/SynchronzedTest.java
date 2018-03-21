package threads;

/**
 * @auther xzl on 15:53 2018/3/21
 * synchronized 关键字:
 * 通过不同的组合测试可以发现：一个线程锁住的 对象和 ClassA 里面的this锁住调用相同方法时，他们共享的是
 * 同一个对象。
 */
public class SynchronzedTest {
    public static void main(String[] args) {
        ClassB classb = new ClassB();
        ClassA classA = new ClassA(classb);
        ThreadA threadA = new ThreadA(classA);
        ThreadB threadB = new ThreadB(classA);
        new Thread(threadA,"线程A").start();
        new Thread(threadB,"线程B").start();
    }
}
