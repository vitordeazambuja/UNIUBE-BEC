package exercicio6;

public class Pessoa {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private String nome;
    private int matricula;

    /* GETTERS E SETTERS */
    public String getNome(){
        return this.nome;
    }
    public int getMatricula(){
        return this.matricula;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public void setMatricula(int matricula){
        this.matricula = matricula;
    }

    /* MÉTODOS */
    public void getInformacoes(){
        System.out.println("Nome: " + this.nome);
        System.out.println("Matrícula: "+ this.matricula);
    }
}
