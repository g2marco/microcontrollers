package mx.com.neogen;

import mx.com.neogen.code.Preprocessor;
import mx.com.neogen.code.SentenceParser;
import mx.com.neogen.code.impls.ProyectGenerator;

import java.io.IOException;

public class Main {
    
    private final static String TEMPLATE_PROYECT_PATH = "D:\\home\\ework\\microcontrollers\\pic12f683\\template_proyect";
    private final static String TARGET_PROYECT_PATH   = "D:\\tmp\\proyect";
    private final static String PROGRAM_PATH = "d:\\tmp\\input.ggma";
    
    
    public static void main(String[] args) throws IOException {
        var preprocessor = new Preprocessor();
        var parser       = new SentenceParser();
        
        var sentences = preprocessor.readSentences( PROGRAM_PATH);
        var programa = parser.parse( sentences);
        
        System.out.println( programa);
        
        var generator = new ProyectGenerator( TEMPLATE_PROYECT_PATH);
        generator.createProyect( TARGET_PROYECT_PATH, programa);
        
    }
    
}