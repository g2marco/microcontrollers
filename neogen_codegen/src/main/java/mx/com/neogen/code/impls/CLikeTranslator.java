package mx.com.neogen.code.impls;

import mx.com.neogen.code.interfaces.Translator;
import mx.com.neogen.code.beans.Node;
import mx.com.neogen.code.beans.Operand;
import mx.com.neogen.code.beans.Operator;
import mx.com.neogen.code.enums.OperandTypeEnum;

public class CLikeTranslator implements Translator {

    public CLikeTranslator() {
        super();
    }

    
    @Override
    public String translate( String signal, Node node) {
        var operands = node.getOperands();
        var operator = node.getOperator();
        
        var strb = new StringBuilder();

        strb.append( "(");
        
        if( operands.length == 1) {
            if ( operator != null) {
                strb.append( translate( operator));
            }
            strb.append( translate( signal, operands[0]));
        
        } else {
            strb.append( translate( signal, operands[0])).
            append( " ").append( translate( operator)).append( " ").
            append( translate( signal, operands[1]));
        
        }
        
        strb.append( ")");
        
        return strb.toString();
    }
    
    private String translate( Operator operator) {
        return operator.getSymbol();
    }
    
    protected String translate( String signal, Operand operand) {
        var strb = new StringBuilder();

        if( operand.getType().equals( OperandTypeEnum.EXPRESSION)) {
            strb.append( translate( signal, (Node) operand.getValue()));
        } else {
                       
            String value = (String) operand.getValue();
            
            if ( value.endsWith( "'rise")) {
                var name = value.substring( 0, value.indexOf( "'"));
                value = "hasChanged_" + name + " && " + name + " == 1";
                
            } else if ( value.endsWith( "'falll")) {
                var name = value.substring( 0, value.indexOf( "'"));
                value = "hasChanged_" + name + " && " + name + " == 0";
                
            } else if ( value.endsWith( "'change")) {
                var name = value.substring( 0, value.indexOf( "'"));
                value = "hasChanged_" + name;
            
            }
                        
            switch( value) {
                case "toggled": value = "!" + signal; break;
                case "ON":      value = "1"; break;
                case "OFF":     value = "0"; break;
            }
            
            strb.append( value);
        }
        
        return strb.toString();
    }
    
}
