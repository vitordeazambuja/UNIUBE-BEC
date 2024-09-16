package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex4 {
    public static void main(String[] args) {
        try {
            // Lê imagem entrada
            BufferedImage imagemEntrada = ImageIO.read(new File("lena_gray_256.png"));

            // Lê dimensões da imagem de entrada
            int larguraEntrada = imagemEntrada.getWidth();
            int alturaEntrada = imagemEntrada.getHeight();

            // Calcula dimensões saída
            int larguraSaida = (int) (larguraEntrada * 1.5);
            int alturaSaida = (int) (alturaEntrada * 1.5);

            // Cria imagem saída
            BufferedImage imagemSaida = new BufferedImage(larguraSaida, alturaSaida, BufferedImage.TYPE_BYTE_GRAY);

            // Ampliação bilinear
            for (int y = 0; y < alturaSaida; y++) {
                for (int x = 0; x < larguraSaida; x++) {
                    double xOriginal = x / 1.5;
                    double yOriginal = y / 1.5;

                    int x1 = (int) xOriginal;
                    int y1 = (int) yOriginal;
                    int x2 = Math.min(x1 + 1, larguraEntrada - 1);
                    int y2 = Math.min(y1 + 1, alturaEntrada - 1);

                    double weightX = xOriginal - x1;
                    double weightY = yOriginal - y1;

                    int valor = (int) (
                            (1 - weightX) * (1 - weightY) * (imagemEntrada.getRGB(x1, y1) & 0xFF) +
                                    weightX * (1 - weightY) * (imagemEntrada.getRGB(x2, y1) & 0xFF) +
                                    (1 - weightX) * weightY * (imagemEntrada.getRGB(x1, y2) & 0xFF) +
                                    weightX * weightY * (imagemEntrada.getRGB(x2, y2) & 0xFF)
                    );

                    imagemSaida.setRGB(x, y, (valor << 16) | (valor << 8) | valor);
                }
            }

            // Salva imagem de saída
            File output = new File("lena_gray_256_bilinear_ampliado_1_5.png");
            ImageIO.write(imagemSaida, "PNG", output);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}