package exercicio6;

public class AppPolimorfismo {
    public static void main(String[] args) {
        Aluno aluno1 = new Aluno();
        aluno1.setNome("Lucas");
        aluno1.setMatricula(52364);
        aluno1.setMedia(75.3);
        aluno1.setQuantidadeDisciplinas(5);

        Professor professor1 = new Professor();
        professor1.setNome("Cláudio");
        professor1.setMatricula(78954);
        professor1.setSalario(5100);
        professor1.setQuantidadeAulas(5);
        professor1.setTurno("Noturno");

        MostraInfo info1 = new MostraInfo();
        info1.mostra(aluno1);
        info1.mostra(professor1);

    }
}
