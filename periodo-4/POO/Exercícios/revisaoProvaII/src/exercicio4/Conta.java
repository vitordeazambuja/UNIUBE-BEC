package exercicio4;

public class Conta {
    /* DECLARAÇÃO DE VARIÁVEIS */
    private String titular;
    private int numero;
    private double saldo;

    /* GETTERS E SETTERS */
    public String getTitular(){
        return this.titular;
    }
    public int getNumero(){
        return this.numero;
    }
    public double getSaldo(){
        return this.saldo;
    }
    public void setTitular(String titular){
        this.titular = titular;
    }
    public void setNumero(int numero){
        this.numero = numero;
    }
    public void setSaldo(double saldo){
        this.saldo = saldo;
    }

    Conta(String titular){
        this.titular = titular;
        System.out.println("Conta criada para "+titular);
    }
}
