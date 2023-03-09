package javastudy;

import java.io.IOException;

public class SortTest {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("정렬 방식을 선택하세요.");
		System.out.println("B : BubbleSort ");
		System.out.println("H : HeapSort ");
		System.out.println("Q : QuickSort ");
		int []arr = {7,4,2,8,3,5,1,6,10,9};
		
		int ch = System.in.read();
		Sort sort = null;
		if(ch == 'B' || ch == 'b')	sort = new BubbleSort(arr);
		else if(ch == 'H' || ch == 'h')	sort = new HeapSort(arr);
		else if(ch == 'Q' || ch == 'q')	sort = new QuickSort(arr);
		else {
			System.out.println("지원되지 않는 기능입니다.");
			return;
		}
		

		sort.ascending();
		sort.descending();
		sort.description();
		
	}

}
