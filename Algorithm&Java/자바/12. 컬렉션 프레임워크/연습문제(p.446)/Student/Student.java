package javastudy;

public class Student {
	String num;
	String name;
	public Student(String num, String name) {
		this.num = num;
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		return Integer.parseInt(this.num);
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Student) {
			Student std = (Student)obj;
			if(this.num == std.num)
				return true;
			else
				return false;
		}
		return false;
	}
	
	@Override
	public String toString() {
		return this.num+":"+this.name;
	}
}
