
import java.util.*;

class MatrixAddition {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int ans[][] = new int[3][3];
        int a[][] = new int[3][3];
        int b[][] = new int[3][3];

        for (int i = 0; i < ans.length; i++) {
            for (int j = 0; j < ans.length; j++) {
                System.out.println("a element" + i + j + " = ");
                a[i][j] = sc.nextInt();
                System.out.println("B element" + i + j + " = ");
                b[i][j] = sc.nextInt();
                ans[i][j] = a[i][j] + b[i][j];
            }
        }

        for (int i[] : ans) {
            for (int j : i) {
                System.out.print(j + " ");
            }
            System.err.println("");
        }

    }
}
