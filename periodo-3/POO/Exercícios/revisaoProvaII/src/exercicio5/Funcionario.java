package exercicio5;

public class Funcionario {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private String nome;
    private String cpf;
    private double salario;
    private int idFuncionario;

    /* GETTERS E SETTERS */
    public String getNome(){
        return this.nome;
    }
    public String getCpf(){
        return this.cpf;
    }
    public double getSalario(){
        return this.salario;
    }
    public int getIdFuncionario(){
        return this.idFuncionario;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public void setCpf(String cpf){
        this.cpf = cpf;
    }
    public void setSalario(double salario){
        this.salario = salario;
    }
    public void setIdFuncionario(int idFuncionario){
        this.idFuncionario = idFuncionario;
    }
    /* MÉTODOS */
    public void setBonificacao(){
        this.salario = this.salario * 1.10;
    }

}
