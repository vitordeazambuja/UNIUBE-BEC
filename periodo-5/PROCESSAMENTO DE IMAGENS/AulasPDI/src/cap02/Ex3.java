package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex3 {
    public static void main(String[] args) {
        try{
            // Criação do arquivo de imagem
            BufferedImage imagemEntrada = ImageIO.read(new File("lena_gray_256.png"));

            // Obtém as dimensões de entrada
            int larguraEntrada = imagemEntrada.getWidth();
            int alturaEntrada = imagemEntrada.getHeight();

            // Calcula as dimensões de saída
            int larguraSaida = (int) (larguraEntrada * 1.5);
            int alturaSaida = (int) (alturaEntrada * 1.5);

            // Cria imagem de saída
            BufferedImage imagemSaida = new BufferedImage(larguraSaida,alturaSaida,BufferedImage.TYPE_BYTE_GRAY);

            // Ampliação vizinho mais próximo
            for(int x = 0; x < larguraSaida; x++){
                for(int y = 0; y < alturaSaida; y++){
                    //Obtém pixel
                    int pixel = imagemEntrada.getRGB((int) (x/1.5), (int) (y/1.5));
                    // Define pixel de saída
                    imagemSaida.setRGB(x,y,pixel);
                }
            }

            // Salva imagem de saída
            File output = new File("lena_gray_vizinho_ampliado_1_5.png");
            ImageIO.write(imagemSaida,"PNG",output);

        }catch(IOException e){
            e.printStackTrace();
        }
    }
}
