package mx.com.neogen.code.beans;


public class AssignmentElement {
    
    private String value;
    private String condition;

    
    public AssignmentElement() {
        super();
    }

    public AssignmentElement( String value, String condition) {
        super();
        
        this.value = value;
        this.condition = condition;
    }
    
    
    public String getValue() {
        return value;
    }
    
    public void setValue( String value) {
        this.value = value;
    }
    
    public String getCondition() {
        return condition;
    }
    
    public void setCondition( String condition) {
        this.condition = condition;
    }
    
    
    @Override
    public String toString() {
        return value + (condition == null? "" : " when " + condition);
    }

}
