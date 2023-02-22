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
/* 랭킹 1등 정답
public class Main {
	public static void main(String[] args) throws Exception{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int N = Integer.parseInt(br.readLine());
		
		for(int i=0; i<N-1; i++) {
			for(int j=0; j<N-i-1; j++)
				bw.write(' ');
			for(int j=0; j<2*i+1; j++) {
				bw.write('*');
			}
			bw.write('\n');
		}
		for(int i=N-1; i>=0; i--) {
			for(int j=0; j<N-i-1; j++)
				bw.write(' ');
			for(int j=0; j<2*i+1; j++) {
				bw.write('*');
			}
			bw.write('\n');
		}
		bw.flush();
	}
}
*/
