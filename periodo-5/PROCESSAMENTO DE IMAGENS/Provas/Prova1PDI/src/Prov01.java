import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Prov01 implements ActionListener {
    private JButton btnAcao = null;
    private JButton btnAcao2 = null;
    private BufferedImage imagem = null;
    private JFrame principal = null;

    public void run() throws IOException {
        principal = new JFrame("Lendo uma imagem PNG");
        principal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        String path = "C:\\Users\\Vitor\\Desktop\\Prova1\\src\\lena_gray_256.png";
        File file = new File(path);
        imagem = ImageIO.read(file);

        ImageIcon icone = new ImageIcon(imagem);
        JLabel labImagem = new JLabel(icone);

        String infoImagem = "Dimensões: ";
        Container contentPane = principal.getContentPane();
        contentPane.setLayout(new BorderLayout());
        contentPane.add(new JScrollPane(labImagem), BorderLayout.CENTER);
        contentPane.add(new JLabel(infoImagem), BorderLayout.NORTH);

        JPanel painel = new JPanel();
        btnAcao = new JButton("Tons de cinza");
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

    @Override
    public void actionPerformed(ActionEvent e){
        if(e.getSource() == btnAcao){
            int w = imagem.getWidth();
            int h = imagem.getHeight();
            int[] pixels = imagem.getRGB(0,0,w,h,null,0,h);

            for (int col = 0; col < w; col++){
                for (int lin = 0; lin <h; lin++){
                    int gray = new Color(pixels[w * lin+col]).getRed();
                    pixels[w * lin + col] = new Color(gray/2,gray/2, gray/2).getRGB();
                }
            }

            imagem.setRGB(0,0,w,h,pixels,0,w);
            principal.repaint();
        }
    }

    public static void main(String[] args) throws IOException {
        new Prov01().run();
    }
}