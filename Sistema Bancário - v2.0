import requests
import pandas as pd
import bcrypt as c
import time

class Usuario:
    def __init__(self, nome, email, senha):
        self.nome = nome
        self.email = email
        self.senha_hash = c.hashpw(senha.encode(), c.gensalt())

    def exibir_usuario(self):
        print(f'Nome: {self.nome} | Email: {self.email}')

    def verificar_login(self, email, senha):
        return self.email == email and c.checkpw(senha.encode(), self.senha_hash)

class ContaBancaria:
    def __init__(self, usuario):
        self.usuario = usuario
        self.saldo = 0
        self.saldo_dolar = 0

    def depositar(self, valor):
        self.saldo += valor
        print(f'Depósito de R${valor:.2f} realizado com sucesso!')

    def depositar_dolar(self, valor):
        self.saldo_dolar += valor
        print(f'Depósito de ${valor:.2f} realizado com sucesso!')

    def converter_dolar_para_real(self):
        if self.saldo_dolar <= 0:
            print("Saldo em dólares insuficiente para conversão.")
            return
        url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL'
        response = requests.get(url)
        if response.status_code == 200:
            cotacao = float(response.json()['USDBRL']['bid'])
            valor_convertido = self.saldo_dolar * cotacao
            self.saldo += valor_convertido
            print(f'Conversão: ${self.saldo_dolar:.2f} USD = R${valor_convertido:.2f} BRL (Cotação: {cotacao:.2f})')
            self.saldo_dolar = 0
        else:
            print('Falha ao obter a cotação do dólar.')

    def exibir_cotacao_dolar(self):
        url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL'
        response = requests.get(url)
        if response.status_code == 200:
            cotacao = float(response.json()['USDBRL']['bid'])
            print(f'Cotação atual do dólar: R${cotacao:.2f}')
        else:
            print('Falha ao obter a cotação do dólar.')

    def sacar(self, valor):
        if valor > self.saldo:
            print('Saldo insuficiente.')
        else:
            self.saldo -= valor
            print(f'Saque de R${valor:.2f} efetuado com sucesso!')

    def verificar_saldo(self):
        print(f'Saldo atual de {self.usuario.nome}: R${self.saldo:.2f} | ${self.saldo_dolar:.2f} USD')

    def realizar_cambio_brl_para_usd(self, valor):
        if valor > self.saldo:
            print('Saldo insuficiente para realizar o câmbio.')
            return
        url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL'
        response = requests.get(url)
        if response.status_code == 200:
            cotacao = float(response.json()['USDBRL']['bid'])
            valor_convertido = valor / cotacao
            self.saldo -= valor
            self.saldo_dolar += valor_convertido
            print(f'Conversão: R${valor:.2f} = ${valor_convertido:.2f} USD (Cotação: {cotacao:.2f})')
        else:
            print('Falha ao obter a cotação do dólar.')

    def realizar_cambio_usd_para_brl(self, valor):
        if valor > self.saldo_dolar:
            print("Saldo em dólares insuficiente para conversão.")
            return
        url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL'
        response = requests.get(url)
        if response.status_code == 200:
            cotacao = float(response.json()['USDBRL']['bid'])
            valor_convertido = valor * cotacao
            self.saldo_dolar -= valor
            self.saldo += valor_convertido
            print(f'Conversão: ${valor:.2f} USD = R${valor_convertido:.2f} BRL (Cotação: {cotacao:.2f})')
        else:
            print('Falha ao obter a cotação do dólar.')

class Banco:
    def __init__(self):
        self.contas = []

    def listar_usuarios(self):
        dados = [{'Nome': c.usuario.nome, 'Email': c.usuario.email} for c in self.contas]
        df = pd.DataFrame(dados)
        print(df if not df.empty else 'Nenhum usuário cadastrado.')

    def criar_conta(self, usuario):
        self.contas.append(ContaBancaria(usuario))
        print('Conta criada com sucesso!')

    def buscar_conta(self, email):
        for conta in self.contas:
            if conta.usuario.email == email:
                return conta
        return None

    def login(self, email, senha):
        for conta in self.contas:
            if conta.usuario.verificar_login(email, senha):
                print('Login efetuado com sucesso!')
                return conta
        print('Credenciais incorretas!')
        return None

def menu():
    banco = Banco()

    while True:
        print("\n=== Menu do Banco Tavares ===")
        print("1 - Efetuar login")
        print("2 - Criar conta")
        print("3 - Listar usuários")
        print("4 - Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            email = input("Email: ")
            senha = input("Senha: ")
            conta = banco.login(email, senha)

            if conta:
                while True:
                    print("\n=== Menu da Conta ===")
                    print("1 - Depositar em Reais")
                    print("2 - Depositar em Dólares")
                    print("3 - Sacar")
                    print("4 - Verificar saldo")
                    print("5 - Realizar câmbio (BRL para USD)")
                    print("6 - Realizar câmbio (USD para BRL)")
                    print("7 - Converter saldo em dólares para reais")
                    print("8 - Exibir cotação atual do dólar")
                    print("9 - Sair")
                    opcao_conta = input("Escolha uma opção: ")

                    if opcao_conta == '1':
                        valor = float(input("Valor para depósito em Reais: "))
                        conta.depositar(valor)
                    
                    elif opcao_conta == '2':
                        valor = float(input("Valor para depósito em Dólares: "))
                        conta.depositar_dolar(valor)
                    
                    elif opcao_conta == '3':
                        valor = float(input("Valor para saque: "))
                        conta.sacar(valor)
                    
                    elif opcao_conta == '4':
                        conta.verificar_saldo()
                    
                    elif opcao_conta == '5':
                        valor = float(input("Valor em BRL para converter em USD: "))
                        conta.realizar_cambio_brl_para_usd(valor)
                    
                    elif opcao_conta == '6':
                        valor = float(input("Valor em USD para converter em BRL: "))
                        conta.realizar_cambio_usd_para_brl(valor)
                    
                    elif opcao_conta == '7':
                        conta.converter_dolar_para_real()
                    
                    elif opcao_conta == '8':
                        conta.exibir_cotacao_dolar()
                    
                    elif opcao_conta == '9':
                        break
                    
                    else:
                        print("Opção inválida.")

        elif opcao == '2':
            nome = input("Nome: ")
            email = input("Email: ")
            senha = input("Senha: ")
            banco.criar_conta(Usuario(nome, email, senha))

        elif opcao == '3':
            banco.listar_usuarios()

        elif opcao == '4':
            print("Saindo...")
            break
        else:
            print("Opção inválida.")

menu()
