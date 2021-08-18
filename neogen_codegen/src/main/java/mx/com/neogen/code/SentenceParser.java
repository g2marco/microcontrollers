package mx.com.neogen.code;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import mx.com.neogen.code.beans.Assignment;
import mx.com.neogen.code.beans.AssignmentElement;
import mx.com.neogen.code.beans.BeanProgram;
import mx.com.neogen.code.beans.Node;
import mx.com.neogen.code.beans.Signal;
import mx.com.neogen.code.beans.SignalTarget;
import mx.com.neogen.code.enums.ReservedWordEnum;
import mx.com.neogen.code.enums.SignalTypeEnum;
import mx.com.neogen.code.enums.TargetTypeEnum;
import mx.com.neogen.code.interfaces.Parser;
import mx.com.neogen.code.interfaces.Translator;


public class SentenceParser {

    public final Parser     parser;
    public final Translator translator;

    
    
    public SentenceParser( Parser parser, Translator translator) {
        super();
        
        this.parser     = parser;
        this.translator = translator;
    }
    
    
    public BeanProgram parse( List<String> sentences) {
        var signals     = new ArrayList<Signal>();
        var assignments = new ArrayList<Assignment>();
        
        for( String sentence : sentences) {
            if ( existsSignal( signals, getFirstToken( sentence))) {
                // assignment definition
                assignments.add( parseAssignment( sentence));
            } else {
                // signal definition
                signals.add( parseSignal(sentence));
            }
        }
        
        return new BeanProgram( signals, assignments);
    }
    
    protected Assignment parseAssignment( String sentence) {
        System.out.println("parsing ASSIGNMENT: " + sentence); 
        var tokens = getTokens( sentence);
        
        var item = new Assignment();
        item.setSignal( tokens[0]);
                
        var elements = getRawAssignmentElements( 1, tokens);
        Node node;
        
        for ( AssignmentElement element : elements) {
            
            System.out.println( "element: " + element);
            
            node = parser.parse( element.getSetExpression());
            element.setSetExpression( translator.translate( item.getSignal(), node));
            
            if( element.hasResetClausule()) {
                node = parser.parse( element.getResetCondition());
                element.setResetCondition( translator.translate( item.getSignal(), node));
            }
            
            if( element.getEveryExpression() != null) {
                node = parser.parse( element.getEveryExpression());
                element.setEveryExpression( translator.translate( item.getSignal(), node));
            }
            
            if ( element.getSetCondition() != null) {
                node = parser.parse( element.getSetCondition());
                element.setSetCondition( translator.translate( item.getSignal(), node));
            }
        }
        
        item.setElements( elements);
        
        return item;
    }
    
    protected Signal parseSignal ( String sentence) {
        System.out.println("parsing   SIGNAL  : " + sentence); 
        var tokens = getTokens( sentence);
        
        var item = new Signal();
        item.setName( tokens[0]);
        
        int i = 1;
        if( !"is".equals( tokens[i])) {
            throw new RuntimeException( "The word 'is' must follow the name of a signal, sentence: " + sentence); 
        }
        ++i;
        
        item.setType( SignalTypeEnum.valueOf( tokens[i]));
        ++i;
        
        if ( !"on".equals( tokens[i])) { 
            ++i;
        }
        
        if ( !"on".equals( tokens[i])) {
            System.out.println( Arrays.toString(tokens) + ", i: " + i);
            throw new RuntimeException( "The word 'on' must follow direction/device type, sentence: " + sentence);
        }
        ++i;
        
        SignalTarget target = new SignalTarget();
        item.setTarget( target);
        
        target.setType( TargetTypeEnum.valueOf( tokens[i]));
        ++i;
        
        target.setName( tokens[i]);
        
        return item;
    }
    
    protected String[] getTokens( String sentence) {
        var items = sentence.split( "[\\s;]");
        var tokens = new ArrayList<String>();
        
        for( String item : items) {
            if ( !item.isBlank()) {
                tokens.add( item);
            }
        }
        return tokens.toArray( new String[] {});
    }
    
    protected List<AssignmentElement> getRawAssignmentElements( int startIdx, String[] tokens) {
        var elements = new ArrayList<AssignmentElement>();
        AssignmentElement element = null;
        
        for( Part part : getSentenceParts( startIdx, tokens)) {
            switch( part.reservedWord) {
                case IS:
                    element = new AssignmentElement();
                    element.setSetExpression( part.expression);
                    elements.add( element);
                    
                    break;
                    
                case FOR  :  
                case WHILE:
                    if ( element == null) {
                        throw new RuntimeException( "ERROR: no se ha iniciado elemento de asignacion");
                    }
                    
                    element.setResetClausule( part.reservedWord);
                    element.setResetCondition( part.expression);
                    
                    break;
                    
                case EVERY:
                    if( element == null) {
                        throw new RuntimeException( "ERROR: no se ha iniciado elemento de asignacion");
                    }
                    
                    element.setEveryExpression( part.expression);
                    
                    break;
                    
                case WHEN:
                    if ( element == null) {
                        throw new RuntimeException( "ERROR: no se ha iniciado elemento de asignacion");
                    }
                    
                    element.setSetCondition( part.expression);
                    
                    break;
                    
                case COMA:
                    throw new RuntimeException( "ERROR: reserved word no manejado");
            }
        }
        
        return elements;
    }
    
    /** 
     *  A sentence element is a collection of expressions separated by reserved words
     */
    
    class Part {
        ReservedWordEnum reservedWord;
        String expression;
    }
        
    
    private List<Part> getSentenceParts( int startIdx, String[] tokens) {
        var elements = new ArrayList();
        
        int idx = startIdx;
        while( idx < tokens.length) {
            idx = addNextPart( idx, tokens, elements);
        }
        
        return elements;
    }
    
    private int addNextPart( int startIdx, String[] tokens, List<Part> parts) {
        var part= new Part();
        var idx = startIdx;
   
        part.reservedWord = ReservedWordEnum.obtenerValor( tokens[ idx]);
        
        String expression = null;
        
        while( ++idx < tokens.length) {
            if( ReservedWordEnum.obtenerValor( tokens[ idx]) != null) {
                break;
            }
            expression = (expression == null)? tokens[ idx] : expression + " " + tokens[ idx]; 
        }
        
        part.expression = expression;
        
        parts.add( part);
        
        return idx;
    }    
   
    
    private String getExpression( int startIdx, String[] tokens) {
        var strb = new StringBuilder();
        
        for ( int i = startIdx ; i < tokens.length; ++i) {
            if( strb.length() > 0) { strb.append( ' '); }
            strb.append( tokens[i]);
        }
        
        return strb.toString();
    }
    
    private boolean existsSignal( List<Signal> items, String name) {
        for( Signal item : items) {
            if( item.getName().equals( name)) {
                return true;
            }
        }
        
        return false;
    }
    
    private String getFirstToken( String sentence) {
        return sentence.split( "\\s")[0];
    }
    
}
