package javastudy;

public class A extends Object{ // 상위클래스인 Object의 모든 기능을 상속
	// 변수
	private final String year = "2023"; 
	private String day = "월";
	static int num =1;
	// 생성자
	A(){
		super(); // 상위 클래스의 생성자 메소드를 호출
	}
	
	//메소드
	public void say() {
		System.out.println(day+"요일입니다.");
	}
	
}
