package javastudy;

public class TotalTest {
	public int add(int num1, int num2) {
		int sum =0;
		sum = num1 + num2;
		return sum;
	}
	public int mutliply(int num1, int num2) {
		int multiple = num1 * num2;
		return multiple;
	}
	
	public int oneTohundredSum() {
		int sumVal=0;
		for(int i=1;i<=100;i++)
			sumVal += i;
		return sumVal;
	}
}
