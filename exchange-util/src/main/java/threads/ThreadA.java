package threads;

/**
 * @auther xzl on 16:16 2018/3/21
 */
public class ThreadA implements Runnable {
    ClassA classA ;
    public ThreadA(ClassA classA){
        this.classA = classA;
    }
    @Override
    public void run() {
//        classA.testThisSynA();
//        classA.testClassSynA();
//        classA.objectA();
        synchronized (classA){//这里锁住 classA
            classA.objectA();
        }
    }
}
