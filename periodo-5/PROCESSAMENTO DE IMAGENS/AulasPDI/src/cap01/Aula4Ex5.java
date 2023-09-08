package cap01;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class Aula4Ex5 {
    public static void main(String[] args) throws Exception {

        // Criação do arquivo de imagem e leitura
        String path = "D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap01\\lena_gray_256.png";
        File file = new File(path);
        BufferedImage imagem = ImageIO.read(file);

        // Definindo largura, altura e pixels
        int width = imagem.getWidth();
        int height = imagem.getHeight();
        int[] pixels = imagem.getRGB(0, 0, width, height, null, 0, width);

        //Manipulação de Imagem
        for (int col = 0; col < width; col++) {
            for (int lin = 0; lin < height; lin++) {
                int gray = new Color(pixels[width * lin + col]).getRed();
                int newGray;
                if (gray < 64) {
                    newGray = 0;
                } else if (gray < 128) {
                    newGray = 85;
                } else if (gray < 192) {
                    newGray = 170;
                } else {
                    newGray = 255;
                }
                pixels[width * lin + col] = new Color(newGray, newGray, newGray).getRGB();
            }
        }
        imagem.setRGB(0, 0, width, height, pixels, 0, width);

        // Criação do buffer e mostra da imagem
        BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        buffer.getGraphics().drawImage(imagem, 0, 0, null);
        ImageIO.write(buffer, "PNG", new File("lena_4n_256.png"));
    }
}
