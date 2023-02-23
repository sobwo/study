package javastudy;

import java.io.*;
import java.util.Scanner;

public class If {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		/*
		문제 1. 
			조건문 활용해서 학생의 나이는 9살
			나이가 8살보다 작으면 취학전 아동이고, 
			나이가 14보다 작으면 초등학생이고, 
			나이가 20살보다 작으면 중고등학생 출력
		*/
		/*
		System.out.print("나이를 입력하시오 : ");
		Scanner sc = new Scanner(System.in);
		int age = sc.nextInt();
		if (age<8)
			System.out.println("취학전 아동입니다.");
		else if (age<14)
			System.out.println("초등학생 입니다.");
		else if (age<20)
			System.out.println("중,고등학생 입니다.");
		*/
		
		//입력받은 값에 홀짝 출력
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		bw.write("숫자를 입력해 주시오 : ");
		
		bw.flush();
		int value = br.read();
		
		if(value % 2 == 0) bw.write("짝수입니다.");
		else bw.write("홀수입니다");
		
		bw.flush();
		bw.close();
		
	}
}
