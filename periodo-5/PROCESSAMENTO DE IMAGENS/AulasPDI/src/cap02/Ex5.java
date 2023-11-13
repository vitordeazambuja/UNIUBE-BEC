package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex5 {
    public static void main(String[] args) {
        try {
            BufferedImage imagemA = ImageIO.read(new File("D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\Fig0230_a.png"));
            BufferedImage imagemB = ImageIO.read(new File("D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\Fig0230_b.png"));

            int larguraA = imagemA.getWidth();
            int alturaA = imagemA.getHeight();
            int larguraB = imagemB.getWidth();
            int alturaB = imagemB.getHeight();

            if (larguraA != larguraB || alturaA != alturaB) {
                System.out.println("As dimensões das imagens não são iguais.");
                return;
            }

            BufferedImage imagemC = new BufferedImage(larguraA, alturaA, BufferedImage.TYPE_INT_RGB);

            for (int y = 0; y < alturaA; y++) {
                for (int x = 0; x < larguraA; x++) {
                    int corA = imagemA.getRGB(x, y);
                    int corB = imagemB.getRGB(x, y);

                    int novoValor = multiplicarCores(corA, corB);

                    imagemC.setRGB(x, y, novoValor);
                }
            }

            File output = new File("Fig0230_c.png");
            ImageIO.write(imagemC, "PNG", output);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static int multiplicarCores(int corA, int corB) {
        int redA = (corA >> 16) & 0xFF;
        int greenA = (corA >> 8) & 0xFF;
        int blueA = corA & 0xFF;

        int redB = (corB >> 16) & 0xFF;
        int greenB = (corB >> 8) & 0xFF;
        int blueB = corB & 0xFF;

        int redNovo = (redA * redB) / 255;
        int greenNovo = (greenA * greenB) / 255;
        int blueNovo = (blueA * blueB) / 255;

        return (redNovo << 16) | (greenNovo << 8) | blueNovo;
    }
}