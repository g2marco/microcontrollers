package mx.com.neogen.code.beans;

public class Assignment {
    
    private String signal;
    private String value;
    
    
    public Assignment() {
        super();
    }


    public String getSignal() {
        return signal;
    }

    public void setSignal(String signal) {
        this.signal = signal;
    }

    public String getValue() {
        return value;
    }

    public void setValue( String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "{signal: " + signal + ", value: " + value + "}";
    }

}
