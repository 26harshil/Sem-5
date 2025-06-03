
import java.util.Scanner;

public class MatrixMul {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int ans[][] = new int[2][2];
        int n = ans.length;
        int m = ans[0].length;
        int a[][] = new int[2][2];
        int b[][] = new int[2][2];

        for (int i = 0; i < ans.length; i++) {
            for (int j = 0; j < ans.length; j++) {
                System.out.println("a element" + i + j + " = ");
                a[i][j] = sc.nextInt();
                System.out.println("B element" + i + j + " = ");
                b[i][j] = sc.nextInt();

            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {

                for (int k = 0; k < 2; k++) {
                    ans[i][j] += a[i][k] * b[k][j];
                }
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
