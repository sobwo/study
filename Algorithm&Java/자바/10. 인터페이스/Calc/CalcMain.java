package javastudy;

public class CalcMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CalcTest calcTest = new CalcTest();
		
		System.out.println(calcTest.add(100, 220));
		System.out.println(calcTest.oneToHunSum());

		Calc calc = new CalcTest();
		System.out.println(calc.oneToHunSum());
		
	}

}
