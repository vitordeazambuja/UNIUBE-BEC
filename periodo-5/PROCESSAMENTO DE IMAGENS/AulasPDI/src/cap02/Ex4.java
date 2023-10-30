package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex4 {
    public static void main(String[] args) {
        try{
            // Lê imagem entrada
            BufferedImage imagemEntrada = ImageIO.read(new File("lena_gray_256.png"));

            // Lê dimensões da imagem de entrada
            int larguraEntrada = imagemEntrada.getWidth();
            int alturaEntrada = imagemEntrada.getHeight();

            // Calcula dimensões saída
            int larguraSaida = (int) (larguraEntrada * 1.5);
            int alturaSaida = (int) (alturaEntrada * 1.5);

            // Cria imagem saída
            BufferedImage imagemSaida = new BufferedImage(larguraSaida,alturaSaida,BufferedImage.TYPE_BYTE_GRAY);

            // Ampliação bilinear
            
            // Salva imagem de saída
            File output = new File("lena_gray_256_bilinear_ampliado_1_5.png");
            ImageIO.write(imagemSaida,"PNG", output);

        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
