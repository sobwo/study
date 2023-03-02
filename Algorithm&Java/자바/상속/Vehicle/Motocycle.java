package javastudy;

public class Motocycle extends Vehicle {
	
	public Motocycle(int wheel) {
		super(wheel);
	}
	
	//오버라이딩
	@Override
	public void move() {
		System.out.println(super.getWheel()+"개의 바퀴를 가진 오토바이가 달린다.");
	}
	
}