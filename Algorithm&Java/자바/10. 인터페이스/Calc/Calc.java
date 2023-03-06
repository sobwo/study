package javastudy;

public interface Calc {
	//클래스가 아니라 문서라서 객체 생성 불가능(생성자 불가)
	//불완전한 메소드만 가지고 있음
	//다중상속 가능
	
	//모든 변수는 상수로 인식(static final 생략)
	double PI = 3.14;
	int a = 1;
	
	//모든 메소드는 불완전하기 때문에 abstract가 앞에 생략되어 있는것과 같다.
	abstract int add(int num1, int num2);
	
	//1에서 100까지의 합
	public int oneToHunSum();
	
}
