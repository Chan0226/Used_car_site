package data.dto.cart;

public class DuplicateItemException extends Exception{
	//��ü ����ȭ�� ���� serial number id
	private static final long serialVersionUID = 1L;
	
	public DuplicateItemException() {
		super("��ǰ �������� �ߺ��Ǿ�, ��ٱ��Ͽ� �߰��� �� �����ϴ�.");
	}

}
