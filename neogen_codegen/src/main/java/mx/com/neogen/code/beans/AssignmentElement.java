package mx.com.neogen.code.beans;

import mx.com.neogen.code.enums.ReservedWordEnum;


public class AssignmentElement {
    
    private String setExpression;
    private String everyExpression;
    private ReservedWordEnum resetClausule;
    private String resetCondition;
    private String setCondition;

    
    public AssignmentElement() {
        super();
    }
    

    public String getSetExpression() {
        return setExpression;
    }

    public void setSetExpression( String setExpression) {
        this.setExpression = setExpression;
    }

    public String getEveryExpression() {
        return everyExpression;
    }

    public void setEveryExpression( String everyExpression) {
        this.everyExpression = everyExpression;
    }
    
    public ReservedWordEnum getResetClausule() {
        return resetClausule;
    }

    public void setResetClausule( ReservedWordEnum resetClausule) {
        this.resetClausule = resetClausule;
    }

    public String getResetCondition() {
        return resetCondition;
    }

    public void setResetCondition( String resetCondition) {
        this.resetCondition = resetCondition;
    }

    public String getSetCondition() {
        return setCondition;
    }

    public void setSetCondition( String setCondition) {
        this.setCondition = setCondition;
    }
    
    public boolean hasResetClausule() {
        return resetClausule != null;
    }
    
    @Override
    public String toString() {
        return "setExpression: " + setExpression + 
            (resetClausule   == null? "" : ", resetClausule: " + resetClausule + ", resetCondition: " + resetCondition) +
            (everyExpression == null? "" : ", every: " + everyExpression) +
            (setCondition    == null? "" : ", setCondition: " + setCondition)
        ;
    }

}
