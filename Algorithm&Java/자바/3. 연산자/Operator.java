package javastudy;

public class Operator {

	public static void main(String[] args) {
		int gameScore = 150;
		
		int lastScore = ++gameScore; // 전위증가로 gameScore에 +1을 한 값을 lastSocre값에 대입
		int lastScore2 = gameScore++; // 후위증가로 gameScore을 lastSocre값에 대입 후 gameScore값 1 증가
		int lastScore3 = ++gameScore; // 전위증가로 gameScore에 +1을 한 값을 lastSocre값에 대입 
		
		//각 값이 나오는 이유를 주석
		System.out.println(lastScore);
		System.out.println(lastScore2);
		System.out.println(lastScore3);
		
//--------------------------------------------------------------------------------------------------
		// EX) 단락 회로 평가 실습하기
		int num1 = 10;
		int i =2;
		boolean value = ((num1 += 10) < 10) && ((i =i+ 2) < 10);
		System.out.println(value);
		System.out.println(num1);
		System.out.println(i);
		
		value = ((num1 += 10) > 10) || ((i= i+ 2) < 10);
		System.out.println(value);
		System.out.println(num1);
		System.out.println(i);
		

	}

}
