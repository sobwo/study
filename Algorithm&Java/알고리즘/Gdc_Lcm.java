package javastudy;

import java.io.*;

public class Gdc_Lcm {

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] str = br.readLine().split(" ");
		int num1 = Integer.parseInt(str[0]);
		int num2 = Integer.parseInt(str[1]);
		
		bw.write(num1+"와 "+num2+"의 최대 공약수는 "+Integer.toString(Gdc(num1,num2)));
		bw.write("\n");
		bw.write(num1+"와 "+num2+"의 최소 공배수는 "+Integer.toString(Lcm(num1,num2)));
		bw.flush();
		bw.close();
	}
	
	static int Gdc(int a, int b) {
		
		int r = 0;
		
		if(a<b) {
			int temp = a;
			a = b;
			b = temp;
		}
		
		while(b!=0) {
			r = a%b;
			a = b;
			b = r;
		
		}
		return a;
	}
	
	static int Lcm(int a, int b) {
		int lcm = a*b/Gdc(a,b);
		return lcm;
	}

}

