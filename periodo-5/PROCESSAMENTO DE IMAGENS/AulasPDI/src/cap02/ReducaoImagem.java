package cap02;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class ReducaoImagem {
	
    public static void main(String[] args) {
        try {
            // Carrega a imagem de entrada em tons de cinza
            BufferedImage imagemEntrada = ImageIO.read(new File("lena_gray_256.png"));
            
            // Obtém as dimensões da imagem de entrada
            int larguraEntrada = imagemEntrada.getWidth();
            int alturaEntrada = imagemEntrada.getHeight();
            
            // Calcula as dimensões da imagem de saída (50% de redução)
            int larguraSaida = larguraEntrada / 2;
            int alturaSaida = alturaEntrada / 2;
            
            // Cria a imagem de saída
            BufferedImage imagemSaida = new BufferedImage(larguraSaida, alturaSaida, BufferedImage.TYPE_BYTE_GRAY);
            
            // Aplica a redução por vizinho mais próximo
            for (int x = 0; x < larguraSaida; x++) {
                for (int y = 0; y < alturaSaida; y++) {
                    int pixel = imagemEntrada.getRGB(x * 2, y * 2); // Obtém o pixel original
                    imagemSaida.setRGB(x, y, pixel); // Define o pixel na imagem de saída
                }
            }
            
            // Salva a imagem de saída
            File output = new File("output.png");
            ImageIO.write(imagemSaida, "png", output);
            
            System.out.println("Imagem de saída gerada com sucesso.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
