package shop.model.vo;

public class Event implements java.io.Serializable{
	private static final long serialVersionUID = 501321778962430461L;
	
	private String shopCode; // 쇼핑몰코드
	private String eventCode; // 이벤트코드
	private String eventName; // 이벤트이름
	
	public Event() {}

	public Event(String shopCode, String eventCode, String eventName) {
		super();
		this.shopCode = shopCode;
		this.eventCode = eventCode;
		this.eventName = eventName;
	}

	public String getShopCode() {
		return shopCode;
	}

	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	@Override
	public String toString() {
		return "Event [shopCode=" + shopCode + ", eventCode=" + eventCode + ", eventName=" + eventName + "]";
	}
}
