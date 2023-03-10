package javastudy;

public class ExTestMain {

	public static void main(String[] args) {

//		int[] a = new int[5];
//		try {
//			for(int i=0;i<=5;i++) {
//				a[i] = i;
//				System.out.println("각 배열 방안의 값은 : "+a[i]);
//			}
//		}catch(ArrayIndexOutOfBoundsException e) {
//			e.printStackTrace();
//			System.out.println("배열 오류 발생");
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally{
//			System.out.println("반드시 실행되어야 하는 영역"); // 오류가 나든 안나든 무조건 실행 ex) 연결 객체를 끊어줘야 될때
//		}
		
		try {
			send();
			receive();
		}catch(Exception e) {
			System.out.println("온라인 송금중 오류 발생");
		}
	}
	
	//throw : 예외 발생   throws : 예외를 상위로 던짐
	
	public static void send() throws Exception { // 발생된 예외를 지금 처리 안하고 상위로 던짐
			System.out.println("돈을 보낸다.");
			throw new Exception(); // 예외 객체를 강제로 발생
		
	}
	
	public static void receive() throws Exception {
		System.out.println("돈을 받다.");
		throw new Exception();
	}
}
