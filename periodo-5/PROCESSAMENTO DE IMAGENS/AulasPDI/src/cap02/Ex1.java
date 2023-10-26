package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;

public class Ex1 {
    public static void main(String[] args) throws Exception {
        // Criação do arquivo de imagem e leitura
        String path = "D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\lena_gray_256.png";
        File file = new File(path);
        BufferedImage imagemEntrada = ImageIO.read(file);

        // Definindo fator, largura, altura e imagem de saída
        double fator = 2.0;
        int larguraEntrada = imagemEntrada.getWidth();
        int alturaEntrada = imagemEntrada.getHeight();

        int larguraSaida = (int) (larguraEntrada * fator);
        int alturaSaida = (int) (alturaEntrada * fator);

        BufferedImage imagemSaida = new BufferedImage(larguraSaida, alturaSaida, BufferedImage.TYPE_BYTE_GRAY);

        // Interpolação Vizinho Mais Próximo
        for (int x = 0; x < larguraSaida; x++){
            for(int y = 0; y < alturaSaida; y++){
                int xEntrada = (int) (x/fator);
                int yEntrada = (int) (y/fator);
                int pixel = imagemEntrada.getRGB(xEntrada,yEntrada);
                imagemSaida.setRGB(x,y,pixel);
            }
        }

        // Criação do arquivo da imagem
        ImageIO.write(imagemSaida, "PNG",new File("lena_gray_256_vizinho_ampliado_2_0.png"));
    }
}
