package mx.com.neogen.code.impls;

import mx.com.neogen.code.Translator;
import mx.com.neogen.code.beans.Node;
import mx.com.neogen.code.beans.Operand;
import mx.com.neogen.code.beans.Operator;
import mx.com.neogen.code.enums.OperandTypeEnum;

public class CLikeTranslator implements Translator {

    public CLikeTranslator() {
        super();
    }

    
    @Override
    public String translate( Node node) {
        var operands = node.getOperands();
        var operator = node.getOperator();
        
        var strb = new StringBuilder();

        strb.append( "(");
        
        if( operands.length == 1) {
            strb.append( translate( operator)).append( translate( operands[0]));
        
        } else {
            strb.append( translate( operands[0])).
            append( " ").append( translate( operator)).append( " ").
            append( translate( operands[1]));
        
        }
        
        strb.append( ")");
        
        return strb.toString();
    }
    
    private String translate( Operator operator) {
        return operator.getSymbol();
    }
    
    protected String translate( Operand operand) {
        var strb = new StringBuilder();

        if( operand.getType().equals( OperandTypeEnum.EXPRESSION)) {
            strb.append( translate( (Node) operand.getValue()));
        } else {
            strb.append( operand.getValue());
        }
        
        return strb.toString();
    }
    
}
