package javastudy;

public class first {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 변수 - 메모리상의 가상공간 데이터를 담는다.
		// 변수명 - 식별자
		// 변수는 데이터의 정류에 따라서 구조화시켜서 데이터 타입을 갖는다.
		/*
		 	정수형 변수
		 	1 byte = byte
		 	2 byte = short
		 	4 byte = int
		 	8 byte = long   ex) long a = 23213L;
		 	
		 	실수형 변수
		 	8 byte = float  ex) float a = 21321f;
		 	16 byte = double
		 */
		
		//byte a = 128; //  data overflow로 오류
		short b = 128;
		System.out.println("b의 값은 : "+b);
		int c = 128;
		System.out.println("c의 값은 : "+c);
		
		// EX) 숫자형 변수 aa와 bb의 합을 출력하시오
		int aa = 3;
		int bb = 5;
		int sum = 0;
		sum = aa+bb;
		System.out.println("aa와 bb의 합은 : "+sum);
		
		// EX) 숫자 1234567891000를 출력하시오
		// int intNum = 123456789100L // data overflow로 오류
		long longNum = 1234567891000L;
		System.out.println(longNum);
		
		// EX) 실수 1.25를 출력하시오
		float floatNum = 1.25f;
		double doubleNum = 1.25;
		System.out.println("float형 실수 : "+floatNum);
		System.out.println("double형 실수 : "+doubleNum);
		
		// 문자 자료형
		int ch3 = 67;
		System.out.println(ch3);
		System.out.println((char)ch3);
		
		String str = "안녕하세요";
		System.out.println(str);
		
		boolean isMarried = true;
		isMarried = false;
		System.out.println(isMarried);
		
		// 상수 - 변하지 않는 변수(대문자로 표현)
		final int MAX_NUM = 100;
		//MAX_NUM = 99; //값 -> 리터럴
		
		
		
		
		
		
		
	}

}
