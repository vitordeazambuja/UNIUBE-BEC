import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
public class LeImagem01 {
    public static void main(String[] args) throws IOException {
        String path = "/home/vitor/code/UNIUBE-BEC/periodo-5/PROCESSAMENTO DE IMAGENS/AulasPDI/src/cap01/lena_gray_256.png";
        File file = new File(path);
        BufferedImage imagem = ImageIO.read(file);
        String infoImagem = "Dimensões: " + imagem.getWidth()
                + "x" + imagem.getHeight() + "\nBandas: "
                + imagem.getRaster().getNumBands();
        System.out.println(infoImagem);
    }
}