package javastudy;

public class first {

	public static void main(String[] args) {
		// 변수 - 메모리상의 가상공간 데이터를 담는다.
		// 변수명 - 식별자
		// 변수는 데이터의 정류에 따라서 구조화시켜서 데이터 타입을 갖는다.
		/*
		 	정수 자료형
		 	1 byte = byte
		 	2 byte = short
		 	4 byte = int
		 	8 byte = long   ex) long a = 23213L;
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
		
//---------------------------------------------------------------------------------------------
		
		/*
		 	실수 자료형
		 	8 byte = float  ex) float a = 21321f;
		 	16 byte = double
		 */
		
		// EX) 실수 1.25를 출력하시오
		float floatNum = 1.25f;
		double doubleNum = 1.25;
		System.out.println("float형 실수 : "+floatNum);
		System.out.println("double형 실수 : "+doubleNum);
		
//---------------------------------------------------------------------------------------------		
		
		/* 
			문자 자료형
			2byte = char;
			String : 
		*/
		int ch3 = 67;
		System.out.println(ch3);
		System.out.println((char)ch3);
		
		String str = "안녕하세요";
		System.out.println(str);
		
//---------------------------------------------------------------------------------------------
		
		/*
			논리자료형
			1byte = boolean;
		 */
		boolean isMarried = true;
		isMarried = false;
		System.out.println(isMarried);
		
//---------------------------------------------------------------------------------------------	
		
		// 상수 - 변하지 않는 변수(대문자로 표현)
		final int MAX_NUM = 100;
		System.out.println(MAX_NUM);
		//MAX_NUM = 99; //값 -> 리터럴
		
//---------------------------------------------------------------------------------------------		
		
		// 형변환
		// 덜 정밀한 데이터가 더 정밀한 쪽으로 형태 변환 (묵시적 형변환)
		// ex) int -> float
		byte byteI = 10;
		int intJ = byteI; 
		System.out.println(intJ);
		
		int intK = 20;
		float floatL = intK;
		System.out.println(floatL);
		
		// 강제적 형변환 (명시적 형변환)
		// 큰 크기에서 작은 크기로 변환 데이터 손실을 고려해야함
		int intM = 180;
		byte byteN = (byte)intM;
		System.out.println(byteN);
		
		// 더 정밀한 -> 덜 정밀한 쪽으로 형변환 시 
		// ex) double -> int
		double doubleO = 3.14;
		int intP = (int)doubleO;
		System.out.println(intP);
		
	}
}
