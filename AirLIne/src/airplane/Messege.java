package airplane;

public class Messege {
private String content;//message display
private String type;   //error
private String cssClass;//indication malpractice 
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getCssClass() {
	return cssClass;
}
public void setCssClass(String cssClass) {
	this.cssClass = cssClass;
}
public Messege(String content, String type, String cssClass) {
	super();
	this.content = content;
	this.type = type;
	this.cssClass = cssClass;
}


	
}
