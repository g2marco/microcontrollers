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
import mx.com.neogen.code.interfaces.Parser;
import mx.com.neogen.code.interfaces.Translator;


public class SentenceParser {

    private class Part {
        int idx;
        String endToken;
        String text;
        
        Part( int idx, String endToken, String text) {
            super();
            
            this.idx = idx;
            this.endToken = endToken;
            this.text = text;
        }
    }
    
    private final String[] END_TOKENS = { "when", "for", "while", "otherwise", ","};
    
    
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
        
        int i = 1;
        if( !"is".equals( tokens[i])) {
            throw new RuntimeException( "The word 'is' must follow the name of a signal, sentence: " + sentence); 
        }
        ++i;
        
        var elements = getRawAssignmentElements( i, tokens);
        Node node;
        
        for ( AssignmentElement element : elements) {
            
            System.out.println( "element: " + element);
            
            node = parser.parse( element.getSetExpression());
            element.setSetExpression( translator.translate( item.getSignal(), node));
            
            if( element.hasResetClausule()) {
                node = parser.parse( element.getResetCondition());
                element.setResetCondition( translator.translate( item.getSignal(), node));
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
        StringBuilder strb;
        String token;
        AssignmentElement element;
        
        var idx = startIdx;
        var elements = new ArrayList<AssignmentElement>();
        Part part;
        
        while( idx < tokens.length) {
            element = new AssignmentElement();
            
            part = getNextPart( tokens, idx, END_TOKENS);
                                 
            element.setSetExpression( part.text);
            idx = part.idx;
            
            if ( part.endToken == null) {   // there is no clauses
                elements.add( element);
                break;
            }
            
            switch ( part.endToken) {
                case "for"  :
                case "while":
                    element.setResetClausule( part.endToken);
                    break;
            }
            
            part = getNextPart( tokens, idx, END_TOKENS);
            idx = part.idx;
            
            // if a reset clausule is present, is followed by the reset condition
            if ( element.getResetClausule() != null) {
                element.setResetCondition( part.text);    
            } else {
                element.setSetCondition( part.text.isEmpty()? null : part.text);
            }
            
            // if reset clausule exists, the last part is the set condition (when)
            if ( element.getResetClausule() != null) {
                part = getNextPart( tokens, idx, END_TOKENS);
                idx = part.idx;
                element.setSetCondition( part.text.isEmpty()? null : part.text);
            }
            
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
    
    private Part getNextPart( String[] tokens, int startIdx, String[] endTokens) {
        var strb = new StringBuilder();
        var idx = startIdx;
        String token;
        String endToken = null;
        
        while( idx < tokens.length) {
            token = tokens[ idx];
            if ( contains( endTokens, token)) {
                endToken = token;
                idx++;
                break;
            }
            
            if( strb.length() > 0) { strb.append( ' '); }
            strb.append( token);                   
            idx++;
        }
        
        return new Part( idx, endToken, strb.toString());
    }
    
    private boolean contains ( String[] items, String value) {
        for( String item : items) {
            if( item.equals( value)) {
                return true;
            }
        }
        
        return false;
    }
    
}
