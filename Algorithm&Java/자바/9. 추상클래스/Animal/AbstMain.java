package javastudy;

public class AbstMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Abstract ab = new Abstract();  추상클래스는 객체 생성 불가능
		
		Animal ani = new Animal(3);
		ani.fly();
		
		//업 캐스팅 가능
		//Abstract(부모클래스)에 fly 메소드가 없어도 추상클래스이기 때문에 자식클래스의 fly 메소드를 오버라이딩하여 사용가능
		Abstract ab = new Animal(2);
		ab.fly();
		System.out.println(ab.getZ()); // 생성자는 존재함 / 접근만 제한
		
		Abstract ab2 = new Animal(5);
		ab2.fly();
		
	}
}
