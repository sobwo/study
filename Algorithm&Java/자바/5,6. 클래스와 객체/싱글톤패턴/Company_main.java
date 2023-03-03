package javastudy;

public class Company_main {
	public static void main(String[] args) {
//		Company company = new Company();
//		System.out.println("객체 주소 값은 : "+company);
//		Company company2 = new Company();
//		System.out.println("객체 주소 값은 : "+company2);   // company와 company2의 주소값이 다름, 각각의 객체 생성
		
		Company com1 = Company.getInstance();
		Company com2 = Company.getInstance();
		
		System.out.println("객체 주소 값은 : "+com1);
		System.out.println("객체 주소 값은 : "+com2);   // com1와 com2의 주소값이 같음, 하나의 클래스에서 활용
	}
}
