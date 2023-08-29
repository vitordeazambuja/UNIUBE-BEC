import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;

public class LeImagem05 implements ActionListener {
    private JButton btnAcao = null;
    private JButton btnAcao2 = null;
    private BufferedImage imagem = null;
    private JFrame principal = null;

    public void run() throws IOException {

        // Estilização da janela (Nimbus está relacionado com java.swing)
        checkNimbus();
        principal = new JFrame("Lendo uma imagem PNG");
        principal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Criação do arquivo de imagem e leitura
        String path = "/home/vitor/code/UNIUBE-BEC/periodo-5/PROCESSAMENTO DE IMAGENS/AulasPDI/src/cap01/lena_gray_256.png";
        File file = new File(path);
        imagem = ImageIO.read(file);

        // Montagem da janela com a imagem
        ImageIcon icone = new ImageIcon(imagem);
        JLabel labImagem = new JLabel(icone);
        String infoImagem = "Dimensões: " + imagem.getWidth() + "x" +
                imagem.getHeight() + "Bandas: " + imagem.getRaster().getNumBands();
        Container contentPane = principal.getContentPane();
        contentPane.setLayout(new BorderLayout());
        contentPane.add(new JScrollPane(labImagem), BorderLayout.CENTER);
        contentPane.add(new JLabel(infoImagem), BorderLayout.NORTH);

        // Criação dos botões e estilização da janela
        JPanel painel = new JPanel();
        btnAcao = new JButton("Efeito Especial");
        btnAcao.addActionListener(this);
        btnAcao2 = new JButton("Salvar Imagem");
        btnAcao2.addActionListener(this);
        painel.add(btnAcao);
        painel.add(btnAcao2);
        contentPane.add(painel, BorderLayout.SOUTH);
        principal.setSize(imagem.getWidth() + 40, imagem.getHeight() + 100);
        principal.setVisible(true);
        principal.setLocationRelativeTo(null);
    }
    private static void checkNimbus() {
        try {
            for (LookAndFeelInfo info :
                    UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Numbus not available!");
        }
    }

    @Override
    public void actionPerformed(ActionEvent actionEvent) {
        if(actionEvent.getSource() == btnAcao) {
            int width = imagem.getWidth();
            int height = imagem.getHeight();
            int[] pixels = imagem.getRGB(0, 0, width, height, null, 0, width);

            //
            for (int col = 0; col < width; col++) {
                for (int lin = 0; lin < height; lin++) {
                    Color color = new Color(pixels[width * lin + col]);
                    int invertedRed = 255 - color.getRed();
                    int invertedGreen = 255 - color.getGreen();
                    int invertedBlue = 255 - color.getBlue();
                    Color inverted = new Color(invertedRed,invertedGreen,invertedBlue);
                    pixels[width * lin + col] = inverted.getRGB();
                }
            }

            //
            imagem.setRGB(0, 0, width, height, pixels, 0, width);
            principal.repaint();
            System.out.println("OK!");
        } else if(actionEvent.getSource() == btnAcao2) {
            System.out.println("Execução do Botão 2");
        }
    }

    public static void main(String[] args) throws IOException {
        new LeImagem05().run();
    }
}