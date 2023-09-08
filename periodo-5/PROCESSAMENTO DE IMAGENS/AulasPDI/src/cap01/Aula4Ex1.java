package cap01;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;

public class Aula4Ex1 {
    public static void main (String [] args) throws Exception{
        int width = 100;
        int height = 100;
        BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics g = buffer.createGraphics();
        g.setColor(Color.BLUE);
        g.fillRect(-50,-50,width,height);
        g.setColor(Color.GREEN);
        g.fillRect(50,-50,width,height);
        g.setColor(Color.RED);
        g.fillRect(-50,50,width,height);
        g.setColor(Color.YELLOW);
        g.fillRect(50,50, width,height);
        g.setColor(Color.WHITE);
        g.drawLine(-100,50,100,50);
        g.drawLine(50,-100,50,100);
        ImageIO.write(buffer, "PNG", new File("ex1.png"));
    }
}
