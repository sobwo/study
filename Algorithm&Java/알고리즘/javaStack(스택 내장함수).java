package javastudy_private;

import java.util.Stack;

public class javaStack {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stack<Integer> stack = new Stack<>();  // 자바 스택 객체 생성
		stack.push(0); // push
		stack.push(1);
		stack.push(2);
		
		stack.pop(); // pop
		stack.pop();
		
		stack.peek(); // 가장 위에 있는 데이터 꺼내기
		
		
	}

}
