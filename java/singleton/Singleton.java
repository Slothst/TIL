package singleton;

public class Singleton {
    private static Singleton singleton = null;

    Singleton(){}

    public static Singleton getInstance() {
        if (singleton == null) {
            return new Singleton();
        }
        return singleton;
    }
}
