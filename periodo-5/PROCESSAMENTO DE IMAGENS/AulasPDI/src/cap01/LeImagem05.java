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
        checkNimbus();
        principal = new JFrame("Lendo uma imagem PNG");
        principal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        String path = "/home/vitor/code/UNIUBE-BEC/periodo-5/PROCESSAMENTO DE IMAGENS/AulasPDI/src/cap01/lena_gray_256.png";
        File file = new File(path);
        imagem = ImageIO.read(file);
        ImageIcon icone = new ImageIcon(imagem);
        JLabel labImagem = new JLabel(icone);
        String infoImagem = "Dimensões: " + imagem.getWidth() + "x" +
                imagem.getHeight() + "Bandas: " + imagem.getRaster().getNumBands();
        Container contentPane = principal.getContentPane();
        contentPane.setLayout(new BorderLayout());
        contentPane.add(new JScrollPane(labImagem), BorderLayout.CENTER);
        contentPane.add(new JLabel(infoImagem), BorderLayout.NORTH);
        JPanel painel = new JPanel();
        btnAcao = new JButton("Efeito Especial");
        btnAcao.addActionListener(this);
        btnAcao2 = new JButton("Salvar Imagem");
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
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == btnAcao) {
            int w = imagem.getWidth();
            int h = imagem.getHeight();
            int[] pixels = imagem.getRGB(0, 0, w, h, null, 0, w);
            Random r = new Random();
            for (int col = 0; col < w; col++) {
                for (int lin = 0; lin < h; lin++) {
                    if (lin % 2 == 0)
                        pixels[w * lin + col] = new Color(r.nextInt(255),
                                col % 255, lin % 255).getRGB();
                }
            }
            imagem.setRGB(0, 0, w, h, pixels, 0, w);
            principal.repaint();
            System.out.println("OK!");
        } else if(e.getSource() == btnAcao2) {
        }
    }
    public static void main(String[] args) throws IOException {
        new LeImagem05().run();
    }
}