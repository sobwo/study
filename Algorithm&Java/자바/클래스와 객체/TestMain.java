package javastudy;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student std = new Student();
		TotalTest tt = new TotalTest();
		System.out.println("이름 : "+std.name);
		System.out.println("나이 : "+std.age);
		System.out.println("성별 : "+std.getGender());
		System.out.println("주소 : "+std.addr);
		System.out.println("키 : "+std.height);
		
		int num1 = 245;
		int num2 = 348;
		System.out.println(tt.add(num1,num2));
		System.out.println(tt.mutliply(num1, num2));
		System.out.println(tt.oneTohundredSum());
	}

}
