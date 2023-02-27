package javastudy;

public class Example {
	
	public int age = 10;
	public String name = "홍길동";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//문제 1.
		//홍길동의 나이는 10살이고, 이순신의 나이는 20살입니다. 라고 객체생성을 통해서 출력하시오.
		
		Example p1 = new Example();
		
		System.out.println(p1.name+"의 나이는 "+p1.age);
		
		p1.age = 20;
		p1.name = "이순신";
		
		System.out.println(p1.name+"의 나이는 "+p1.age);
		
		
	}

}
