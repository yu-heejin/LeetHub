import java.util.Arrays;
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
 
        long[] sumArr = new long[1000001];  //0 부분은 비워놓고 1~1000000
        Arrays.fill(sumArr, 1);
        
        for(int i=2; i<1000001; i++) {
            for(int j=1; i*j<1000001; j++) {   //index 값이 1000000일 때까지
                sumArr[j*i] += i;
                /*
                    1*2(2) += 2    1*3(3) += 3
                    2*2(4) += 2    2*3(6) += 3
                    3*2(6) += 2    3*3(9) += 3
                    4*2(8) += 2    4*3(12) += 3
                    
                    즉, 각 배수에는 배수의 약수가 들어가게 됨
                */
            }
            sumArr[i] = sumArr[i-1] + sumArr[i];
            /*
                2 = 1 + 2
                3 = 3 + 3
            */
        }   // 시간 복잡도 n^2
        
        int a = Integer.parseInt(br.readLine());   //테스트 케이스 개수 입력
        while(a-- > 0) {
            bw.write(sumArr[Integer.parseInt(br.readLine())] + "\n");
        }
        
        br.close();
        bw.flush();
        bw.close();
    }
}