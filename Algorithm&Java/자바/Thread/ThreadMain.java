package javastudy;

public class ThreadMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadFirst tf = new ThreadFirst();
		
		tf.start();
		
		for(int i=0;i<10;i++) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("1초마다 쓰레드 출력");
			
		}
	}

}
