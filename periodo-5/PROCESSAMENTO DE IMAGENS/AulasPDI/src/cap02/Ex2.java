package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex2 {
    public static void main(String[] args) {
        try{
            // Criação do arquivo de imagem
            BufferedImage imagemEntrada = ImageIO.read(new File("lena_gray_256.png"));

            // Obtém as dimensões da imagem de entrada
            int larguraEntrada = imagemEntrada.getWidth();
            int alturaEntrada = imagemEntrada.getHeight();

            // Calcula as dimensões da imagem de saída
            int larguraSaida = larguraEntrada/2;
            int alturaSaida = alturaEntrada/2;

            // Cria a imagem de saída
            BufferedImage imagemSaida = new BufferedImage(larguraSaida, alturaSaida, BufferedImage.TYPE_BYTE_GRAY);

            // Redução por vizinho mais próximo
            for (int x = 0; x < larguraSaida; x++){
                for(int y = 0; y < alturaSaida; y++){
                    // Obtém o pixel original
                    int pixel = imagemEntrada.getRGB(x*2,y*2);
                    // Define o pixel na imagem de saída
                    imagemSaida.setRGB(x,y,pixel);
                }
            }

            // Salva a imagem de saída
            File output = new File("lena_gray_256_vizinho_reduzido_50.png");
            ImageIO.write(imagemSaida,"PNG",output);

        }catch(IOException e){
            e.printStackTrace();
        }
    }
}
