package javascript1230;

import java.io.*;

public class StarWrite7{
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int num = Integer.parseInt(br.readLine());
		
		for(int i=0;i<num;i++) {
			for(int j=i;j<num-1;j++)
				bw.write(" ");
			for(int k=0;k<i*2+1;k++)
				bw.write("*");
			bw.write("\n");
		}
		for(int i=num;i<num*2-1;i++) {
			for(int j=num;j<=i;j++)
				bw.write(" ");
			for(int k=(num*2-1)*2-1-i;k>i;k--)
				bw.write("*");
			bw.write("\n");
		}
		bw.flush();
		bw.close();
	}
}
/* 숏코딩
import java.util.Scanner;
public class Main{
    public static void main(String[] args){
        int n = new Scanner(System.in).nextInt();
        for(int i=0; i<2*n-1; i++) 
            System.out.println(" ".repeat(Math.abs(n-1-i)) + "*".repeat((2*n-1)-2*Math.abs(n-1-i)));
    }
}*/
