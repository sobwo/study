package javaStudy;

public class SonClass extends FatherClass {
	
	
	
	public void move() {
		System.out.println("빨리달린다");
	}
	public void re_move() {
		super.move(0);	
	}	
}
