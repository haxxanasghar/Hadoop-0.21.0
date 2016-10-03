class TimeTest1 {
   public static void main(String[] args) {

      //long startTime = System.currentTimeMillis();
      long startTime = System.nanoTime();

      long total = 0;
      for (long i = 0; i < 20000; i++) {
         total += i;
      }

      //long stopTime = System.currentTimeMillis();
      long stopTime = System.nanoTime();
      long elapsedTime = stopTime - startTime;
      System.out.println(elapsedTime);
   }
}
