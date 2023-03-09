package javastudy;

public class HeapSort implements Sort {
	private int[] arr;
	
	public HeapSort(int[] arr) {
		this.arr = arr;
	}
	@Override
	public void ascending() {
		System.out.println("HeapSort ascending");
	}

	@Override
	public void descending() {
		System.out.println("HeapSort descending");

	}

	@Override
	public void description() {
		System.out.println("숫자를 정렬하는 알고리즘입니다.");
		System.out.println("HeapSort입니다.");

	}

}
