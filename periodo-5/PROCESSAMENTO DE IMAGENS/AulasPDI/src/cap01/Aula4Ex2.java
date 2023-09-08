package cap01;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class Aula4Ex2 {
    public static void main (String [] args) throws Exception{
        int width = 200;
        int height = 20;
        BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics g = buffer.createGraphics();
        Color color1 = new Color(0,0,0);
        Color color2 = new Color(25,25,25);
        Color color3 = new Color (50,50,50);
        Color color4 = new Color (75,75,75);
        Color color5 = new Color (100,100,100);
        Color color6 = new Color (125,125,125);
        Color color7 = new Color (150,150,150);
        Color color8 = new Color(175,175,175);
        Color color9 = new Color(200,200,200);
        Color color10 = new Color(225,225,225);
        g.setColor(color1);
        g.fillRect(0,0,20,20);
        g.setColor(color2);
        g.fillRect(20,0,20,20);
        g.setColor(color3);
        g.fillRect(40,0,20,20);
        g.setColor(color4);
        g.fillRect(60,0,20,20);
        g.setColor(color5);
        g.fillRect(80,0,20,20);
        g.setColor(color6);
        g.fillRect(100,0,20,20);
        g.setColor(color7);
        g.fillRect(120,0,20,20);
        g.setColor(color8);
        g.fillRect(140,0,20,20);
        g.setColor(color9);
        g.fillRect(160,0,20,20);
        g.setColor(color10);
        g.fillRect(180,0,20,20);
        ImageIO.write(buffer, "PNG", new File("ex2.png"));
    }
}
