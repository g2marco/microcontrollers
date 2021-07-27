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
import mx.com.neogen.code.enums.SignalTypeEnum;
import mx.com.neogen.code.enums.TargetTypeEnum;
import mx.com.neogen.code.impls.AssignmentHelper;


public class SentenceParser {
    
    public final AssignmentHelper helper;

    
    public SentenceParser( AssignmentHelper helper) {
        super();
        
        this.helper = helper;
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
        
        int i = 1;
        if( !"is".equals( tokens[i])) {
            throw new RuntimeException( "The word 'is' must follow the name of a signal, sentence: " + sentence); 
        }
        ++i;
        
        var elements = getRawAssignmentElements( i, tokens);
        Node node;
        
        for ( AssignmentElement element : elements) {
            
            System.out.println( "element: " + element);
            
            node = helper.parseExpression( element.getValue());
            element.setValue( helper.translate( node));
            
            if ( element.getCondition() != null) {
                node = helper.parseExpression( element.getCondition());
                element.setCondition( helper.translate( node));
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
        StringBuilder strb;
        String token;
        AssignmentElement element;
        
        var idx = startIdx;
        var elements = new ArrayList<AssignmentElement>();
        
        while( idx < tokens.length) {
            strb = new StringBuilder();
            while( idx < tokens.length) {
                token = tokens[ idx];
                if ( "when".equals( token)) {
                    break;
                }
                strb.append( token);                   
                idx++;
            }
        
            element = new AssignmentElement();
            element.setValue( strb.toString());
        
            strb = new StringBuilder();
            while( idx < tokens.length) {
                token = tokens[ idx];
                if ( ",".equals( token)) {
                    break;
                }
                strb.append( token);                   
                idx++;
            }
        
            element.setCondition( strb.length() == 0? null : strb.toString());
        
            elements.add( element);
        }
        
        return elements;
    }
    
    protected String getExpression( int startIdx, String[] tokens) {
        var strb = new StringBuilder();
        
        for ( int i = startIdx ; i < tokens.length; ++i) {
            if( strb.length() > 0) { strb.append( ' '); }
            strb.append( tokens[i]);
        }
        
        return strb.toString();
    }
    
    protected boolean existsSignal( List<Signal> items, String name) {
        for( Signal item : items) {
            if( item.getName().equals( name)) {
                return true;
            }
        }
        
        return false;
    }
    
    protected String getFirstToken( String sentence) {
        return sentence.split( "\\s")[0];
    }
}
