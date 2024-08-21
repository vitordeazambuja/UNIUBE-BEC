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
        g.fillRect(0, 0, width / 2, height / 2);
        g.setColor(Color.GREEN);
        g.fillRect(width / 2, 0, width / 2, height / 2);
        g.setColor(Color.RED);
        g.fillRect(0, height / 2, width / 2, height / 2);
        g.setColor(Color.YELLOW);
        g.fillRect(width / 2, height / 2, width / 2, height / 2);
        g.setColor(Color.WHITE);
        g.drawLine(0,height/2,width,height/2);
        g.drawLine(width/2,0,width/2,height);
        g.drawLine(10,10,90,10);
        g.drawLine(10,10,10,90);
        g.drawLine(10,90,90,90);
        g.drawLine(90,10,90,90);
        ImageIO.write(buffer, "PNG", new File("ex1.png"));
    }
}
