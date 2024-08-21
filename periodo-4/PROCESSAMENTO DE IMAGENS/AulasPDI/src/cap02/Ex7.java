package cap02;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Ex7 {
    public static void main(String[] args) {
        try {
            BufferedImage imagemA = ImageIO.read(new File("D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\Fig0241_a.png"));
            BufferedImage imagemB = ImageIO.read(new File("D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\Fig0241_b.png"));
            BufferedImage imagemC = ImageIO.read(new File("D:\\Code\\UNIUBE-BEC\\periodo-5\\PROCESSAMENTO DE IMAGENS\\AulasPDI\\src\\cap02\\Fig0241_c.png"));

            calcularEstatisticas("Imagem A", imagemA);
            calcularEstatisticas("Imagem B", imagemB);
            calcularEstatisticas("Imagem C", imagemC);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void calcularEstatisticas(String nomeImagem, BufferedImage imagem) {
        int largura = imagem.getWidth();
        int altura = imagem.getHeight();

        int totalPixels = largura * altura;
        double somaIntensidades = 0;
        double somaIntensidadesQuadrado = 0;

        for (int y = 0; y < altura; y++) {
            for (int x = 0; x < largura; x++) {
                int intensidade = (imagem.getRGB(x, y) >> 16) & 0xFF;

                somaIntensidades += intensidade;
                somaIntensidadesQuadrado += intensidade * intensidade;
            }
        }

        double media = somaIntensidades / totalPixels;

        double variancia = (somaIntensidadesQuadrado / totalPixels) - (media * media);

        double desvioPadrao = Math.sqrt(variancia);

        System.out.println();
        System.out.println("Média: " + media);
        System.out.println("Variância: " + variancia);
        System.out.println("Desvio Padrão: " + desvioPadrao);
        System.out.println();
    }
}
