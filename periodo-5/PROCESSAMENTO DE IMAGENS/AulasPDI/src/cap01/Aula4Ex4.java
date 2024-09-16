package cap01;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class Aula4Ex4 {
    public static void main(String[] args) throws Exception {

        // Criação do arquivo de imagem e leitura
        String path = "D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap01\\lena_gray_256.png";
        File file = new File(path);
        BufferedImage imagem = ImageIO.read(file);

        // Definindo largura e altura
        int width = 128;
        int height = 128;

        // Redimensionando a imagem
        BufferedImage newImage = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = newImage.createGraphics();
        g2d.drawImage(imagem, 0, 0, width, height, null);

        // Salvando a imagem
        ImageIO.write(newImage, "PNG", new File("lena_gray_128.png"));
    }
}
