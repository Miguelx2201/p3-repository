import javax.swing.JOptionPane;

public class Texto {
    public static void main(String[] args) {
        String resultado = JOptionPane.showInputDialog(null, args[0]);
        System.out.println(resultado != null ? resultado : "");   
    }
}
