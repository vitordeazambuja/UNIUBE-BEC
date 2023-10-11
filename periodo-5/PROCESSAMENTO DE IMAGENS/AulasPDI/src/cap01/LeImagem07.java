package cap01;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;

public class LeImagem07 implements ActionListener {
	
	private JButton btnAcao = null;
	private JButton btnAcao2 = null;
	private BufferedImage imagem = null;
	private JFrame principal = null;

	public void run() throws IOException {
		
		checkNimbus();
		
		principal = new JFrame("Lendo uma imagem PNG");
		principal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		String path = "lena_color_225.png";
		File file = new File(path);
		imagem = ImageIO.read(file);
		
		ImageIcon icone = new ImageIcon(imagem);
		JLabel labImagem = new JLabel(icone);
		
		String infoImagem = "Dimensões: " + imagem.getWidth() + "x" + imagem.getHeight() + "Bandas: " + imagem.getRaster().getNumBands();
		
		Container contentPane = principal.getContentPane();
		contentPane.setLayout(new BorderLayout());
		contentPane.add(new JScrollPane(labImagem), BorderLayout.CENTER);
		contentPane.add(new JLabel(infoImagem), BorderLayout.NORTH);
		
		JPanel painel = new JPanel();
		btnAcao = new JButton("Tons de cinza");
		btnAcao.addActionListener(this);
		btnAcao2 = new JButton("Salvar Imagem");
		btnAcao2.addActionListener(this);
		painel.add(btnAcao);
		painel.add(btnAcao2);
		contentPane.add(painel, BorderLayout.SOUTH);
		
		principal.setSize(imagem.getWidth() + 40, imagem.getHeight() + 100);
		principal.setVisible(true);
		principal.setLocationRelativeTo(null);
	}

	private static void checkNimbus() {
		try {
		    for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
		        if ("Nimbus".equals(info.getName())) {
		            UIManager.setLookAndFeel(info.getClassName());
		            break;
		        }
		    }
		} catch (Exception e) {
		    JOptionPane.showMessageDialog(null, "Numbus not available!");
		}
	}

	@Override
public void actionPerformed(ActionEvent e) {

	if(e.getSource() == btnAcao) {
		int w = imagem.getWidth();
		int h = imagem.getHeight();
		int[] pixels = imagem.getRGB(0, 0, w, h, null, 0, w);
		for (int col = 0; col < w; col++) {
			for (int lin = 0; lin < h; lin++) {
				Color color = new Color(pixels[w * lin + col] );
				int tom = (color.getBlue() + color.getRed() + color.getGreen())/3;
				pixels[w * lin + col] = new Color(tom, tom, tom).getRGB();
			}
		}
		imagem.setRGB(0, 0, w, h, pixels, 0, w);
		principal.repaint();
	} else if(e.getSource() == btnAcao2) {
		final JFileChooser fc = new JFileChooser();
		int returnVal = fc.showSaveDialog(principal);
        if (returnVal == JFileChooser.APPROVE_OPTION) {
            File file = fc.getSelectedFile();
            try {
				ImageIO.write(imagem, "PNG", file);
				JOptionPane.showMessageDialog(principal, "OK!");
			} catch (IOException e1) {
				JOptionPane.showMessageDialog(principal, "Erro: "+e1.getMessage());
			}
        } else {
          //  
        }
	}
}
	
	public static void main(String[] args) throws IOException {
		new LeImagem07().run();
	}
}
