package mx.com.neogen;

import mx.com.neogen.code.Preprocessor;
import mx.com.neogen.code.SentenceParser;
import mx.com.neogen.code.impls.ProyectGenerator;

import java.io.IOException;
import mx.com.neogen.code.ExpressionParser;
import mx.com.neogen.code.beans.Operator;
import mx.com.neogen.code.enums.OperatorTypeEnum;
import mx.com.neogen.code.impls.CLikeTranslator;
import mx.com.neogen.code.interfaces.Parser;
import mx.com.neogen.code.interfaces.Translator;

public class Main {
    private final static String BASE_PATH_DIR = "D:\\home\\ework\\microcontrollers\\pic12f683\\";
    
    private final static String TEMPLATE_PROYECT_PATH = BASE_PATH_DIR + "template_proyect";
    private final static String TARGET_PROYECT_PATH   = BASE_PATH_DIR + "project\\code";
    
    //private final static String PROGRAM_PATH          = BASE_PATH_DIR + "project\\001_simple_assignment.ggma";
    //private final static String PROGRAM_PATH          = BASE_PATH_DIR + "project\\002_two_inputs.ggma";
    //private final static String PROGRAM_PATH          = BASE_PATH_DIR + "project\\003_turn_on_turn_off.ggma";
    private final static String PROGRAM_PATH          = BASE_PATH_DIR + "project\\004_turn_on_turn_off_Xms.ggma";
    
    private static Parser createExpressionParser() {
        var operators = new Operator[] {
            new Operator( OperatorTypeEnum.UNARY ,          "not",  "!", 1),
            new Operator( OperatorTypeEnum.UNARY ,            "!",  "!", 1),
            new Operator( OperatorTypeEnum.BINARY,         " or ", "||", 3),
            new Operator( OperatorTypeEnum.BINARY,        " and ", "&&", 4),
            new Operator( OperatorTypeEnum.BINARY,           "==",       8),
            new Operator( OperatorTypeEnum.BINARY,     " equals ", "==", 8),
            new Operator( OperatorTypeEnum.BINARY,           "!=",       8),
            new Operator( OperatorTypeEnum.BINARY, " not equals ", "!=", 8),
        };
        
        return new ExpressionParser( operators, false);
    }
    
    private static Translator createExpressionTranslator() {
        return new CLikeTranslator();
    }
    
   
    public static void main(String[] args) throws IOException {
        
        // obtain instrucion lines
        var preprocessor = new Preprocessor();
        var sentences    = preprocessor.readSentences( PROGRAM_PATH);

        // parses each instruction
        var sentenceParser = new SentenceParser( createExpressionParser(), createExpressionTranslator());
        var programa  = sentenceParser.parse( sentences);
        
        System.out.println( programa);
        
        // generates low-level code
        var generator = new ProyectGenerator( TEMPLATE_PROYECT_PATH);
        generator.createProyect( TARGET_PROYECT_PATH, programa);
    }
    
}