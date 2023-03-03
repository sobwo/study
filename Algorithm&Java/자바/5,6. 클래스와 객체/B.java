package javastudy;

public class B {
	private int pi;
	private String pname;
	private int age = 10;
	private int weight = 20;
	
	B(int i, String name){
		this.pi = i;
		this.pname = name;
	}
	
	public void print() {
		System.out.println("i = "+this.pi);
		System.out.println("name = "+this.pname);
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
}
