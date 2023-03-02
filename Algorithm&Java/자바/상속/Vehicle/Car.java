package javastudy;

public class Car extends Vehicle {
	public Car(int wheel) {
		super(wheel);
	}
	
	//오버라이딩
	@Override
	public void move() {
		System.out.println(super.getWheel()+"개의 바퀴를 가진 자동차가 멈췄다.");
	}
	
	//오버로딩
	public void move(int v) {
		System.out.println(super.getWheel()+"개의 자동차가 "+v+"m/s 속도로 달린다.");
	}
}
