package javastudy_private;

import java.util.LinkedList; // 자바에서 큐는 LinkedList를 활용해서 구현
import java.util.Queue; 

public class javaQueue {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Queue<Integer> queue = new LinkedList<>(); //큐 객체 선언

		queue.add(1);     // queue에 값 1 추가
		queue.add(2);     // queue에 값 2 추가
		queue.offer(3);   // queue에 값 3 추가
		
		queue.poll();       // queue에 첫번째 값을 반환하고 제거 비어있다면 null
		queue.remove();     // queue에 첫번째 값 제거
		
		queue.peek(); // queue 첫번쨰 값 추출
	}

}
