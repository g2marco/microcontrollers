package mx.com.neogen.code.beans;

import mx.com.neogen.code.enums.OperatorTypeEnum;

public abstract class Operator {
    
    private final OperatorTypeEnum type;
    private final String value;
    private final int precedence;
    
    
    public Operator( OperatorTypeEnum type, String value, int precedence) {
        super();
        
        this.type  = type;
        this.value = value;
        this.precedence = precedence;
    }
    
    
    public OperatorTypeEnum getType() {
        return type;
    }

    public String getValue() {
        return value;
    }
    
    public int getPrecedence() {
        return precedence;
    }
    

    public abstract Object execute(  Object... values);
    
    
    @Override
    public String toString() {
        return value;
    }
    
}
