
import java.util.*;

class MinMax {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int arr[] = new int[5];

        for (int idx = 0; idx < arr.length; idx++) {
            System.out.println("Entere the  number of " + idx + " = ");
            arr[idx] = sc.nextInt();

        }
        int min = Integer.MAX_VALUE;
        int max = 1;
        for (int i : arr) {
            if (i > max) {
                max = i;
            }
            if (i < min) {
                min = i;
            }
          
        }
        System.out.println("The maximum Number is ="+max);
            
        System.out.println("The minumum Number is ="+min);

    }
    
}
