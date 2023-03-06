package javastudy;

public class CalcTest extends Object implements Calc{

	@Override
	public int add(int num1, int num2) {
		// TODO Auto-generated method stub
		int sum = 0;
		sum = num1+num2;
		return sum;
	}
	
	@Override
	public int oneToHunSum() {
		int sum=0;
		for(int i=1;i<=100;i++)
			sum += i;
		return sum;
	}
}
