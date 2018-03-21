package threads;

/**
 * @auther xzl on 16:16 2018/3/21
 */
public class ThreadB implements Runnable {
    ClassA classA ;
    public ThreadB(ClassA classA){
        this.classA = classA;
    }
    @Override
    public void run() {
        classA.testThisSynB();
//        classA.testClassSynB();
//        classA.objectB();
    }
}
