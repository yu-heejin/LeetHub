import java.util.Scanner;

public class Main {
    // ** 다시 풀어볼 문제
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        int[] dp = new int[11];   //n은 양수이며 11보다 작다 (1~10)
        
        dp[1] = 1;  //1
        dp[2] = 2;  //1+1, 2
        dp[3] = 4;  //1+1+1, 1+2, 2+1, 3
        for(int i=4; i<11; i++) {
            //원래 있던 숫자로 만들고자 하면 1+3, 2+2, 3+1
            //각 경우의 수에 +1, +2, +3을 해주기만 하면 됨
            dp[i] = dp[i-3] + dp[i-2] + dp[i-1];
        }
        
        for(int i=0; i<t; i++) {
            int n = sc.nextInt();
            System.out.println(dp[n]);
        }
    }
}