package javastudy;

public class BubbleSort implements Sort {
	private int[] arr;
	public BubbleSort(int[] arr) {
		this.arr = arr;
	}
	
	@Override
	public void ascending() {
		System.out.println("BubbleSort ascending");
	}

	@Override
	public void descending() {
		System.out.println("QuickSort descending");
	}

	@Override
	public void description() {
		// TODO Auto-generated method stub

	}

}
