package exercicio6;

public class Aluno extends Pessoa {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private double media;
    private int quantidadeDisciplinas;

    /* GETTERS E SETTERS */
    public double getMedia(){
        return this.media;
    }
    public int getQuantidadeDisciplinas(){
        return this.quantidadeDisciplinas;
    }
    public void setMedia(double media){
        this.media = media;
    }
    public void setQuantidadeDisciplinas(int quantidadeDisciplinas){
        this.quantidadeDisciplinas = quantidadeDisciplinas;
    }

    /* MÉTODOS */
    @Override
    public void getInformacoes(){
        super.getInformacoes();
        System.out.println("Média: "+ this.media);
        System.out.println("Quantidade de Disciplinas: "+ this.quantidadeDisciplinas);
    }
}
