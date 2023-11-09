package singleton;

// Holder Initialization 방법 사용 - LazyHolder
public class EnhancedSingleton {
    private EnhancedSingleton(){}

    public static EnhancedSingleton getInstance() {
        return LazyHolder.INSTANCE;
    }

    private static class LazyHolder {
        public static final EnhancedSingleton INSTANCE = new EnhancedSingleton();
    }
}
