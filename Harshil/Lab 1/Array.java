
import java.util.*;

class Array {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int arr[] = new int[5];

        for (int idx = 0; idx < arr.length; idx++) {
            System.out.println("Entere the  number of "+idx+" = ");
               arr[idx]= sc.nextInt();

        }
    for(int i: arr){
     System.out.print(i+"");
    }
    }
}
