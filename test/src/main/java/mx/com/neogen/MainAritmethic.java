package mx.com.neogen;

import java.io.IOException;
import mx.com.neogen.code.impls.ArithmeticEvaluator;
import mx.com.neogen.code.Evaluator;
import mx.com.neogen.code.EvaluatorTranslator;
import mx.com.neogen.code.ExpressionParser;
import mx.com.neogen.code.Parser;
import mx.com.neogen.code.beans.Operator;
import mx.com.neogen.code.enums.OperatorTypeEnum;
import mx.com.neogen.code.impls.JavaArithmeticEvaluator;
import mx.com.neogen.code.impls.TextTreeTranslator;


public class MainAritmethic {

    public static void main(String[] args) {
        var items = new Operator[5];
        
        items[0] = new Operator( OperatorTypeEnum.BINARY, "*", 3) {
            @Override
            public Number execute( Object... values) {
                return ((Number)values[0]).doubleValue() * ((Number)values[1]).doubleValue();
            }
        };
        
        items[1] = new Operator( OperatorTypeEnum.BINARY, "/", 3) {
            @Override
            public Number execute( Object... values) {
                return ((Number)values[0]).doubleValue() / ((Number)values[1]).doubleValue();
            }
        };
        
        items[2] = new Operator( OperatorTypeEnum.BINARY, "+", 2) {
            @Override
            public Number execute( Object... values) {
                return ((Number)values[0]).doubleValue() + ((Number)values[1]).doubleValue();
            }
        };
        
        items[3] = new Operator( OperatorTypeEnum.BINARY, " - ", 2) {
            @Override
            public Number execute( Object... values) {
                return ((Number)values[0]).doubleValue() - ((Number)values[1]).doubleValue();
            }
        };
        
        items[4] = new Operator( OperatorTypeEnum.UNARY, "-", 1) {
            @Override
            public Number execute( Object... values) {
                return  -((Number)values[0]).doubleValue();
            }
        };
        
        try (
            EvaluatorTranslator evtran = new JavaArithmeticEvaluator( "D:\\tmp\\MainArithmetic.java");
        ) {
            evtran.init();
            
            var parser = new ExpressionParser( items);      
            var evaluator = new ArithmeticEvaluator( evtran);
            
            int test = 0;
        
            testCase( ++test, parser, evaluator, "alfa + beta",  "alfa + beta", "alfa", "beta");
            
            
            testCase( ++test, parser, evaluator, "-alfa + beta", "-alfa + beta", "alfa", "beta");
            
            
            testCase( ++test, parser, evaluator, "alfa - beta + gamma", "alfa - beta + gamma", "alfa", "beta", "gamma");
            
            
            testCase( ++test, parser, evaluator,
                "alfa + beta - (-gamma)", "alfa + beta - (-gamma)", "alfa", "beta", "gamma"
            );
            
           
            testCase( ++test, parser, evaluator,
                "(alfa + beta) - gamma"  , "(alfa + beta) - gamma", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "-alfa + beta - gamma", "-alfa + beta - gamma", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "-(alfa + beta) - gamma", "-(alfa + beta) - gamma", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "alfa + (beta - gamma)", "alfa + (beta - gamma)", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "alfa * beta - gamma", "alfa * beta - gamma", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "alfa + beta / gamma", "alfa + beta / gamma", "alfa", "beta", "gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "alfa * beta / -gamma", "alfa * beta / -gamma", "alfa", "beta","gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "((alfa + beta) * (gamma / beta))",
                "((alfa +  beta) * (gamma / beta))", 
                "alfa", "beta","gamma"
            );
            
            
            testCase( ++test, parser, evaluator,
                "(-(alfa / beta) + (gamma * beta))",
                "(-(alfa / beta) + (gamma * beta))",
                "alfa", "beta","gamma"
            );
            
            testCase( ++test, parser, evaluator,
                "(((alfa / beta) / omega) / (gamma / beta))",
                "(((alfa / beta) / omega) / (gamma / beta))", 
                "alfa", "beta", "gamma", "omega"
            );
            
            
            testCase( ++test, parser, evaluator,
                "(((alfa * beta) * omega) * -(gamma * beta))",
                "(((alfa * beta) * omega) * -(gamma * beta))",
                "alfa", "beta", "gamma", "omega"
            );
            
            testCase( ++test, parser, evaluator,
                "gamma / beta * epsilon / phi * delta",
                "gamma / beta * epsilon / phi * delta", 
                "gamma", "beta", "epsilon", "phi", "delta"
            );
            
            testCase( ++test, parser, evaluator,
                "(((alfa - beta) / omega) / (gamma / beta - ((epsilon / phi) - delta)))",
                "(((alfa - beta) / omega) / (gamma / beta - ((epsilon / phi) - delta)))",
                "alfa", "beta", "gamma", "omega", "epsilon", "phi", "delta"
            );
            
            testCase( ++test, parser, evaluator,
                "((-(alfa / beta) / omega) - (gamma / beta / ((epsilon - phi) * delta)))",
                "((-(alfa / beta) / omega) - (gamma / beta / ((epsilon - phi) * delta)))",
                "alfa", "beta", "gamma", "omega", "epsilon", "phi", "delta"
            );
            
            
            testCase( ++test, parser, evaluator,
                "((alfa / beta) / omega) / (gamma / beta * ((epsilon * phi) / delta))",
                "((alfa / beta) / omega) / (gamma / beta * ((epsilon * phi) / delta))",
                "alfa", "beta", "gamma", "omega", "epsilon", "phi", "delta"
            );
            
            testCase( ++test, parser, evaluator,
                "((alfa / beta) - omega) / -(gamma + beta * ((epsilon / phi) * delta))",
                "((alfa / beta) - omega) / -(gamma + beta * ((epsilon / phi) * delta))",
                "alfa", "beta", "gamma", "omega", "epsilon", "phi", "delta"
            );
            
        } catch( Exception ex) {
            ex.printStackTrace();
            
        }
    }
    
    private static void testCase( int test, Parser parser, Evaluator evaluator, String expression, String nativeExpression, String... variables) throws IOException {
        var translator = new TextTreeTranslator();  
        
        info( "\ntree for " + test + ": [" + expression + "]");
        info( "native expression: " + nativeExpression);
        
        var root = parser.parse( expression);
        info( root);
        info( translator.translate(root));
        evaluator.evaluate( test, nativeExpression, root, variables);
    }
    
    
    
    private static void info( Object data) {
        System.out.println( data);
    }
    
}
