package cap03;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

// Filtragem Espacial Por Janelamento
public class ExSala1 {
    // A partir da imagem len_gray_256.png, aplicar a filtragem espacial com janela n x n, onde o n é um parâmetro ajustável
    // Primeiro trabalhar como se fosse 3x3 fixo

    public static void main(String[] args) throws Exception {
        // Criação do arquivo de imagem e leitura:
        String path = "C:\\Users\\Vitor\\Documents\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap03\\lena_gray_256.png";
        File file = new File(path);
        BufferedImage imagemEntrada = ImageIO.read(file);

        // Definição de propriedades e criação imagem saida
        double fator = 1.0;

        int larguraEntrada = imagemEntrada.getWidth();
        int alturaEntrada = imagemEntrada.getHeight();

        int larguraSaida = (int) (larguraEntrada * fator);
        int alturaSaida = (int) (alturaEntrada * fator);

        BufferedImage imagemSaida = new BufferedImage(larguraSaida, alturaSaida, BufferedImage.TYPE_BYTE_GRAY);

        // Filtragem Janelamento 3x3 fixo
        for (int x = 0; x < larguraSaida; x++){
            for(int y = 0; y < alturaSaida; y++){
                int count = 0;
                int xEntrada = (int) (x/fator);
                int yEntrada = (int) (x/fator);

                int tom1 = 0;
                if(xEntrada > 0 && yEntrada > 0){
                    count++;
                    tom1 = new Color(imagemEntrada.getRGB(xEntrada - 1,yEntrada - 1)).getBlue();
                }

                int tom2 = 0;
                if(yEntrada > 0){
                    count++;
                    tom2 = new Color(imagemEntrada.getRGB(xEntrada,yEntrada - 1)).getBlue();
                }

                int tom3 = 0;
                if (xEntrada < 255 && yEntrada > 0){
                    count++;
                    tom3 = new Color(imagemEntrada.getRGB(xEntrada + 1,yEntrada - 1)).getBlue();
                }

                int tom4 = 0;
                if (xEntrada > 0){
                    count++;
                    tom4 = new Color(imagemEntrada.getRGB(xEntrada - 1,yEntrada)).getBlue();
                }

                count++;
                int tom5 = new Color(imagemEntrada.getRGB(xEntrada,yEntrada)).getBlue();

                int tom6 = 0;
                if(xEntrada < 255){
                    count++;
                    tom6 = new Color(imagemEntrada.getRGB(xEntrada + 1,yEntrada)).getBlue();
                }

                int tom7 = 0;
                if(xEntrada > 0 && yEntrada < 255){
                    count++;
                    tom7 = new Color(imagemEntrada.getRGB(xEntrada - 1,yEntrada + 1)).getBlue();
                }

                int tom8 = 0;
                if(yEntrada < 255){
                    count++;
                    tom8 = new Color(imagemEntrada.getRGB(xEntrada,yEntrada + 1)).getBlue();
                }

                int tom9 = 0;
                if(xEntrada < 255 && yEntrada < 255){
                    count++;
                    tom9 = new Color(imagemEntrada.getRGB(xEntrada + 1,yEntrada + 1)).getBlue();
                }


                int total = tom1 + tom2 + tom3 + tom4 + tom5 + tom6 + tom7 + tom8 + tom9;
                int media = total / count;

                imagemSaida.setRGB(x,y,new Color(media,media,media).getRGB());

            }
        }

    }

}
