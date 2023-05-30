package exercicio5;

public class Gerente extends Funcionario {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private int senha;
    private int numeroFuncionarioGerenciados;

    /* GETTERS E SETTERS */
    public int getSenha(){
        return this.senha;
    }
    public int getNumeroFuncionarioGerenciados(){
        return this.numeroFuncionarioGerenciados;
    }
    public void setSenha(int senha){
        this.senha = senha;
    }
    public void setNumeroFuncionarioGerenciados(int numeroFuncionarioGerenciados){
        this.numeroFuncionarioGerenciados = numeroFuncionarioGerenciados;
    }
    /* MÉTODOS */
    @Override
    public void setBonificacao(){
        setSalario(getSalario()*1.15);
    }
}
