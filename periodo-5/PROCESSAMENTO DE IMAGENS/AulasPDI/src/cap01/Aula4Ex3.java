package cap01;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class Aula4Ex3 {
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
        int threshold = 128;
        for (int col = 0; col < width; col++) {
            for (int lin = 0; lin < height; lin++) {
                int gray = new Color(pixels[width * lin + col]).getRed();
                if (gray < threshold) {
                    pixels[width * lin + col] = new Color(0, 0, 0).getRGB();
                } else {
                    pixels[width * lin + col] = new Color(255, 255, 255).getRGB();
                }
            }
        }
        imagem.setRGB(0, 0, width, height, pixels, 0, width);

        // Criação do buffer e mostra da imagem
        BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        buffer.getGraphics().drawImage(imagem,0,0,null);
        ImageIO.write(buffer, "PNG", new File("lena_bw_256.png"));
    }
}
