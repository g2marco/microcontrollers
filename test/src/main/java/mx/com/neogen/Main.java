package mx.com.neogen;

import mx.com.neogen.code.Preprocessor;
import mx.com.neogen.code.SentenceParser;
import mx.com.neogen.code.impls.ProyectGenerator;

import java.io.IOException;
import mx.com.neogen.code.impls.AssignmentHelper;

public class Main {
    
    private final static String TEMPLATE_PROYECT_PATH = "D:\\home\\ework\\microcontrollers\\pic12f683\\template_proyect";
    private final static String TARGET_PROYECT_PATH   = "D:\\home\\ework\\microcontrollers\\pic12f683\\project\\code";
    private final static String PROGRAM_PATH          = "D:\\home\\ework\\microcontrollers\\pic12f683\\project\\input.ggma";
    
    
    public static void main(String[] args) throws IOException {
        var preprocessor = new Preprocessor();
        var parser       = new SentenceParser( new AssignmentHelper());
        
        var sentences = preprocessor.readSentences( PROGRAM_PATH);
        var programa = parser.parse( sentences);
        
        System.out.println( programa);
        
        var generator = new ProyectGenerator( TEMPLATE_PROYECT_PATH);
        generator.createProyect( TARGET_PROYECT_PATH, programa);
        
    }
    
}