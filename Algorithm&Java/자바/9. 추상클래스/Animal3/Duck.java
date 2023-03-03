package javastudy;

public class Duck extends Animal3{
	
	public Duck(String name) {
		super(name);

	}
	
	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 낮에 잔다");
	}

	@Override
	public void eat() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 하루 1끼를 먹는다.");
	}

	@Override
	public void sleep() {
		// TODO Auto-generated method stub
		System.out.println(super.name+"는 밤에 논다.");
	}
	
	@Override
	public void info() {
		System.out.println(super.name+"은 다리와 날개가 2개이다.");
		play();
		eat();
		sleep();
	}
}
