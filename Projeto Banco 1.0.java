interface Banco {
    void depositar(double valor);

    void sacar(double valor);
}

class ContaBancaria implements Banco {
    private double saldo;

    public ContaBancaria(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public void depositar(double valor) {
        if (valor > 0) {
            saldo += valor;
            System.out.println("Deposito efetuado com sucesso.");
        } else {
            System.out.println("Valor de depósito invalido.");
        }

    }

    @Override
    public void sacar(double valor) {
        if (valor > saldo) {
            System.out.println("Saldo insuficiente.");
        } else {
            saldo -= valor;
            System.out.println("Saque efetuado com sucesso.");
        }

    }

    public double getSaldo() {
        return this.saldo;
    }
}

public class Main {
    public static void main(String[] args) {
        ContaBancaria conta = new ContaBancaria(5000);
        conta.depositar(2000);
        conta.sacar(6000);
        System.out.println("Saldo da conta: " + conta.getSaldo());

    }
}