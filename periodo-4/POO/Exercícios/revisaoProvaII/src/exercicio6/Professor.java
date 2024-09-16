package exercicio6;

public class Professor extends Pessoa {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private double salario;
    private int quantidadeAulas;
    private String turno;

    /* GETTERS E SETTERS */
    public double getSalario(){
        return this.salario;
    }
    public int getQuantidadeAulas(){
        return this.quantidadeAulas;
    }
    public String getTurno(){
        return this.turno;
    }
    public void setSalario(double salario){
        this.salario = salario;
    }
    public void setQuantidadeAulas(int quantidadeAulas){
        this.quantidadeAulas = quantidadeAulas;
    }
    public void setTurno(String turno){
        this.turno = turno;
    }

    /* MÉTODOS */
    @Override
    public void getInformacoes(){
        super.getInformacoes();
        System.out.println("Salário: "+this.salario);
        System.out.println("Quantidade de Aulas: "+this.quantidadeAulas);
        System.out.println("Turno: "+this.turno);
    }
}
