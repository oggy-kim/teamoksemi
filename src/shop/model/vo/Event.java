package shop.model.vo;

public class Event implements java.io.Serializable{
	private static final long serialVersionUID = 501321778962430461L;
	private String eventCode; // 이벤트코드
	private String eventName; // 이벤트이름
	
	public Event() {}

	public Event(String eventCode, String eventName) {
		super();
		this.eventCode = eventCode;
		this.eventName = eventName;
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
		return "Event [eventCode=" + eventCode + ", eventName=" + eventName + "]";
	}
	
	
}
