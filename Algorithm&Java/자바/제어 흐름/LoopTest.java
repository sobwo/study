package javastudy;

import java.io.*;

public class LoopTest{

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		// 연습문제 p.123
		/* 문제 1번
			int num1 = 10;
			int num2 = 2;
			char operator = br.readLine().charAt(0);
			if(operator == '+') bw.write(Integer.toString(num1+num2));
			else if (operator == '-') bw.write(Integer.toString(num1-num2));
			else if (operator == '*') bw.write(Integer.toString(num1*num2));
			else if (operator == '/') bw.write(Integer.toString(num1/num2));
			
			bw.write("\n");
			bw.flush();
		 */
		
		/* 문제 2번
			for(int i=1;i<=9;i++) {
				for(int j=1;j<=9;j++)
				{
					if(i%2==0)
					bw.write(i+"*"+j+"="+Integer.toString(i*j)+" ");
					else continue;
				}
			bw.write("\n");
			}
			
			bw.flush();
		*/
		
		/* 문제 3번
			for(int i=1;i<=9;i++) {
				for(int j=1;j<=9;j++) {
					if(i>=j)
						bw.write(i+"*"+j+"="+Integer.toString(i*j)+" ");
					else break;
				}
				bw.write("\n");
			}
			bw.flush();
		
		*/
		
		/* 문제 4번
		int num = Integer.parseInt(br.readLine());
		for(int i=0;i<num;i++) {
			for(int j=i;j<num-1;j++) 
				bw.write(" ");
			for(int k=0;k<2*i+1;k++)
				bw.write("*");
			bw.write("\n");
		}
		bw.flush();
		*/
		
		/*문제 5번
		int num = Integer.parseInt(br.readLine());
		for(int i=0;i<num;i++) {
			for(int j=i;j<num-1;j++) 
				bw.write(" ");
			for(int k=0;k<2*i+1;k++)
				bw.write("*");
			bw.write("\n");
		}
		for(int i=num-1;i>=0;i--) {
			for(int j=0;j<=num-i-1;j++)
				bw.write(" ");
			for(int k=0;k<i*2-1;k++)
				bw.write("*");
			bw.write("\n");
		}
		
		bw.flush();
		bw.close();
		*/
	}
}
