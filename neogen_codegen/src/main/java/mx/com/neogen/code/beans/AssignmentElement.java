package mx.com.neogen.code.beans;


public class AssignmentElement {
    
    private String setExpression;
    private String resetClausule;
    private String resetCondition;
    private String setCondition;

    
    public AssignmentElement() {
        super();
    }
    

    public String getSetExpression() {
        return setExpression;
    }

    public void setSetExpression(String setExpression) {
        this.setExpression = setExpression;
    }

    public String getResetClausule() {
        return resetClausule;
    }

    public void setResetClausule(String resetClausule) {
        this.resetClausule = resetClausule;
    }

    public String getResetCondition() {
        return resetCondition;
    }

    public void setResetCondition(String resetCondition) {
        this.resetCondition = resetCondition;
    }

    public String getSetCondition() {
        return setCondition;
    }

    public void setSetCondition(String setCondition) {
        this.setCondition = setCondition;
    }

    public boolean hasResetClausule() {
        return resetClausule != null;
    }
    
    
    @Override
    public String toString() {
        return "setExpression: " + setExpression + 
            (resetClausule == null? "" : ", resetClausule: " + resetClausule + ", resetCondition: " + resetCondition) +
            (setCondition  == null? "" : ", setCondition: " + setCondition)
        ;
    }

}
