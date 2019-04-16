public class Example {
  public static void main (String[] args) {

    int r0 = 0;
    int r1 = 10;
    while(r1 != 0) {
      r0 += r1;
      r1 --;
    }
    System.out.println("r0=" + r0 + ", r1=" + r1);
  }
}
