import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
public class LeImagem03 {
    public static void main(String[] args) throws IOException {
        // Criaçao de tela
        JFrame principal = new JFrame("Tela");
        principal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        String path = "D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap01\\lena_gray_256.png";

        // Leitura da imagem
        File file = new File(path);
        BufferedImage imagem = ImageIO.read(file);

        // Criaçao de tela
        ImageIcon icone = new ImageIcon(imagem);
        JLabel labImagem = new JLabel(icone);
        Container contentPane = principal.getContentPane();
        contentPane.setLayout(new BorderLayout());
        contentPane.add(new JScrollPane(labImagem), BorderLayout.CENTER);
        principal.setSize(800, 600);
        principal.setVisible(true);
        principal.setLocationRelativeTo(null);
    }
}