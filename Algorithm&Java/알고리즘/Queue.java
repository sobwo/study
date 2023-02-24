package javastudy_private;

import java.io.*;
import java.util.ArrayList;

public class Queue{
	private static ArrayList<Integer> queue = new ArrayList<Integer>();
	
	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] str = br.readLine().split(" ");
		int num1 = Integer.parseInt(str[0]);
		int num2 = Integer.parseInt(str[1]);
		int num3 = Integer.parseInt(str[2]);
		
		enQueue(num1);
		enQueue(num2);
		enQueue(num3);
		deQueue();
		deQueue();
		System.out.print("현재 큐의 값 : ");		
		for(int i:queue)
			System.out.print(i+" ");

	}
	
	static void enQueue(int a) throws IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		queue.add(a);
		
		bw.write("큐 삽입"+"\n");
		bw.flush();
		
	}
	
	static void deQueue() throws IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		if(queue.size()==0) bw.write("큐가 비어있습니다."+"\n");
		else{
			queue.remove(0);
			bw.write("큐 삭제"+"\n");			
		}

		bw.flush();
	}
}
