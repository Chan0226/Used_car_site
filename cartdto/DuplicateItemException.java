package data.dto.cart;

public class DuplicateItemException extends Exception{
	//객체 직렬화를 위한 serial number id
	private static final long serialVersionUID = 1L;
	
	public DuplicateItemException() {
		super("상품 아이템이 중복되어, 장바구니에 추가할 수 없습니다.");
	}

}
