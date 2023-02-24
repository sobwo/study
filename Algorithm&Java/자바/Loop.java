package javastudy;

import java.io.*;

public class Loop {

	public static void main(String[] args) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		/*
		문제 1.
			  1에서 100까지의 합을 for문을 활용해서 합을 출력하시오.
		 */
		int sum = 0;
		for(int i=1;i<=100;i++)
			sum += i;
		
		bw.write(Integer.toString(sum));
		bw.write("\n");
		bw.flush();
		
		// while문 활용
		int i = 1;
		sum = 0;
		while(i<=100) {
			sum += i;
			i++;
		}
		bw.write(Integer.toString(sum));
		bw.write("\n");
		bw.flush();

		
		// do-while문 활용
		sum = 0;
		i = 1;
		
		do {
			sum += i;
			i++;
		}while(i<=100);
		
		bw.write(Integer.toString(sum));
		bw.write("\n");
		bw.flush();
		
		/*
		문제2. 조건문과 반복문을 활용해서 1에서 100까지의 숫자 중에 홀수 합을 출력
		 */
		sum=0;
		for(int j=1;j<=100;j++) {
			if(j%2==1)
				sum += j;
			else
				continue;
		}
		bw.write(Integer.toString(sum));
		bw.flush();
		bw.close();
		
	}

}
