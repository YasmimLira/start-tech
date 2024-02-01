public class Main {
    public static String funIdade(int idade) {
        if (idade <= 17){
            return "ADOLESCENTE";
        } else if (idade >= 18 && idade <= 29) {
            return "JOVEM";
        } else if (idade >= 30 && idade <= 59) {
            return "ADULTO";
        } else if (idade >= 60) {
            return "IDOSO";
        } else {
            return "IDADE INVÁLIDA";
        }
    }

    public static void main(String[] args) {

        System.out.println(">>> Listagem dos Clientes");
        System.out.println(">>> Ano atual: 2024");
        System.out.println("_______________________________________");

        int anoAtual = 2024;
        String nome1 = "Fulano";
        int data1 = 1980;
        int idadeF = anoAtual - data1;
        String faixaEtaria = funIdade(idadeF);

        System.out.println("Nome: " + nome1);
        System.out.println("Data de Nascimento: " + data1);
        System.out.println("Idade: " + idadeF);
        System.out.println("Característica Etária: " + faixaEtaria);


        System.out.println("_______________________________________");

        String nome2 = " Sicrano";
        int data2 = 2000;
        int idadeS = anoAtual - data2;
        String faixaEtaria2 = funIdade(idadeS);

        System.out.println("Nome: " + nome2);
        System.out.println("Data de Nascimento: " + data2);
        System.out.println("Idade: " + idadeS);
        System.out.println("Característica Etária: " + faixaEtaria2);

    }
}