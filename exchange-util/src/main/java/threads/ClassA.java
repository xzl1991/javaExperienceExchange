package threads;

/**
 * @auther xzl on 18:04 2018/3/13
 */
public class ClassA implements Runnable{
    private ClassB classB;
    //region ==构造器
    public ClassA(ClassB classB) {
        this.classB =  classB;
    }
    public ClassA() {
//        this.classB =  classB;
    }
    //endregion ==构造器
    //region === 通过this 锁住
    public void  testThisSynA(){
        synchronized (this){
            System.out.println("this==SynA==:"+Thread.currentThread().getName());
            try {
                Thread.sleep(4000);
                System.out.println("结束===this==SynA==:"+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    public void  testThisSynB(){
        synchronized (this){
            System.out.println("this===SynB==="+Thread.currentThread().getName());
            try {
                Thread.sleep(8000);
                System.out.println("结束===this===SynB==="+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    //endregion === 通过this 锁住
    //region === 通过.class 锁住
    public void  testClassSynA(){
        synchronized (ClassB.class){
            System.out.println(Thread.currentThread().getName()+"锁住了class====");
            try {
                Thread.sleep(8000);
                System.out.println("结束===锁住class===="+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    public void  testClassSynB(){
        synchronized (ClassB.class){
            System.out.println("锁住了classB====="+Thread.currentThread().getName());
            try {
                Thread.sleep(4000);
                System.out.println("结束===锁住了classB====="+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    //endregion ===  通过.class 锁住
    //region ==通过实例锁住
    public   void objectA(){
        synchronized(classB){
            try {
                System.out.println(Thread.currentThread().getName()+"锁住了对象=====");
//                classB.wait(100);
                Thread.sleep(4000);
                System.out.println("结束===锁住了对象B====="+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    public   void objectB(){
        synchronized(classB){
            try {
                System.out.println(Thread.currentThread().getName()+"锁住-了对象B=====");
//                classB.wait(100);
                Thread.sleep(8000);
                System.out.println("结束===锁住了对象B====="+Thread.currentThread().getName());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
    //endregion ==通过实例锁住


    public static void main(String[] args) {
//        ClassB classB = new ClassB();
//        ClassA classA = new ClassA(classB);
//        classA.test();
        new Thread(new ClassA()).start();
        ClassB classB = new ClassB();
        new Thread(classB).start();
        classB.testB();
    }

    @Override
    public void run() {
        System.out.println("A-----run");
    }
}
