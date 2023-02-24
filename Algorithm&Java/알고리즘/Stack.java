package javastudy_private;

import java.io.*;
import java.util.ArrayList;

public class Stack {
	private static ArrayList<Integer> stack = new ArrayList<Integer>();
	
	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] str = br.readLine().split(" ");
		int num1 = Integer.parseInt(str[0]);
		int num2 = Integer.parseInt(str[1]);
		int num3 = Integer.parseInt(str[2]);
		
		push(num1);
		push(num2);
		push(num3);
		pop();
		pop();
		pop();
		pop();
		System.out.print("현재 스택의 값 : ");		
		for(int i:stack)
			System.out.print(i+" ");

	}
	
	static void push(int a) throws IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		stack.add(a);
		bw.write("push"+"\n");
		bw.flush();
	}
	
	static void pop() throws IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int	count = stack.size(); 

		if(count==0) bw.write("스택이 비어 있습니다"+"\n");
		else {
			stack.remove(count-1);
			bw.write("pop"+"\n");
		}
		
		bw.flush();
	}
}
