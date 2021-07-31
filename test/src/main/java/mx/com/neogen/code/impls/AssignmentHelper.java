package mx.com.neogen.code.impls;

import java.util.ArrayList;
import mx.com.neogen.code.ExpressionParser;
import mx.com.neogen.code.interfaces.Parser;
import mx.com.neogen.code.interfaces.Translator;
import mx.com.neogen.code.beans.Node;
import mx.com.neogen.code.beans.Operator;
import mx.com.neogen.code.enums.OperatorTypeEnum;


public class AssignmentHelper {
    
    static {
        System.out.println("AssignmentHelper static init");
    }
    
    private final Parser parser;
    private final Translator translator;
    
    
    public AssignmentHelper() {
        super();
        
        this.parser     = new ExpressionParser( initOperators(), true);
        this.translator = new CLikeTranslator();
    }
    
        
    public Node parseExpression( String expression) {
        return parser.parse( expression);      
    }
    
    public String translate( String signal, Node root) {
        return translator.translate( signal, root);
    }
    
    
    private final Operator[] initOperators() {
        var items = new ArrayList<Operator>();
        
        items.add( new Operator( OperatorTypeEnum.UNARY ,          "not",  "!", 1));
        items.add( new Operator( OperatorTypeEnum.UNARY ,            "!",  "!", 1));
        items.add( new Operator( OperatorTypeEnum.BINARY,         " or ", "||", 3));
        items.add( new Operator( OperatorTypeEnum.BINARY,        " and ", "&&", 4));
        items.add( new Operator( OperatorTypeEnum.BINARY,           "==",       8));
        items.add( new Operator( OperatorTypeEnum.BINARY,     " equals ", "==", 8));
        items.add( new Operator( OperatorTypeEnum.BINARY,           "!=",       8));
        items.add( new Operator( OperatorTypeEnum.BINARY, " not equals ", "!=", 8));
        
        return items.toArray( new Operator[] {});
    }
    
}
