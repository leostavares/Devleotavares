import pandas as pd 

import bcrypt as c

import time 

class Usuario:
    
    def __init__(self,nome,email,senha):
        self.nome = nome
        self.email = email
        self.senha_hash = c.hashpw(senha.encode(),c.gensalt())

    def exibir_usuario(self):
        print(f'Nome:{self.nome} Email:{self.email}')
    
    def verificar_login(self,email,senha):
        if self.email == email:
            if c.checkpw(senha.encode(),self.senha_hash):
                print('Loguin efetuado com sucesso!')
                return True
            else:
                print('Senha incorreta.')
                return False
        else:
            print('Email incorreto.')
            return False

class ContaBancaria:
    
    def __init__(self,usuario):
        self.usuario = usuario
        self.saldo = 0

    def depositar(self,valor):
        self.saldo += valor
        time.sleep(3)
        print(f'Deposito de {valor} realizado com sucesso!')

    def sacar(self,valor):
        if valor>self.saldo:
            print(f'Verificando Saldo de {self.usuario.nome}...')
            time.sleep(3)
            print('Saldo insuficiente.')
        else:
            self.saldo -= valor
            print(f'Verificando Saldo de {self.usuario.nome}...')
            time.sleep(3)
            print(f'Saque de {valor} efetuado com sucesso!')
    
    def verificar_saldo(self):
        print(f'Saldo atual de {self.usuario.nome}: {self.saldo} R$')

class Banco:
    
    def __init__(self):
        self.contas = []

    def listar_usuarios(self):
        dados = []
        for conta in self.contas:
            dados.append({
                'Nome':conta.usuario.nome,
                'Email':conta.usuario.email
            })
        df = pd.DataFrame(dados)
        print('Verificando banco de dados...')
        time.sleep(3)
        print(df)

    def criar_conta(self,usuario):
        nova_conta = ContaBancaria(usuario)
        self.contas.append(nova_conta)
        print('Conta adicionada com sucesso!')
    
    def buscar_contas(self,email):
        for conta in self.contas:
            if conta.usuario.email == email:
                print('Buscando no banco de dados...')
                time.sleep(3)
                return conta
        print('Usuario nao encontrado.')
        return None
    
    def login(self,email,senha):
        for conta in self.contas:
            if conta.usuario.email == email and c.checkpw(senha.encode(), conta.usuario.senha_hash):
                print('Loguin efetuado com sucesso!')
                return conta
        print('Credenciais incorretas!')
        return None
        
def menu():
    
    b = Banco()
    
    usuario_log = None
   
    while True:
        print('Menu do Banco Tavares')
        print('1 = Efetuar login.')
        print('2 = Criar conta.')
        print('3 = Listar usuários.')
        print('4 = Sair.')
        escolha = int(input('O que deseja: '))

        if escolha == 1:
            email = input('Digite o seu email: ')
            senha = input('Digite sua senha: ')
            usuario_log=b.login(email,senha)
           
            if usuario_log:
                
                while True:
                    print('1 = Depositar.')
                    print('2 = Sacar.')
                    print('3 = Verificar saldo.')
                    print('4 = Sair.')
                    op = int(input('Digite sua opção: '))

                    if op == 1:
                        valor = float(input('Digite o valor a ser depositado: '))
                        usuario_log.depositar(valor)  # Agora chama o método na conta bancária

                    elif op == 2:
                        valor = float(input('Digite o valor a ser sacado: '))
                        usuario_log.sacar(valor)  # Método de saque na conta

                    elif op == 3:
                        usuario_log.verificar_saldo()  # Método de verificação de saldo na conta

                    elif op == 4:
                        break

                    else:
                        print('Opção inválida.')

            else:
                print('Credenciais incorretas.')

        elif escolha == 2:
            nome = input('Nome: ') 
            email = input('Email: ')           
            senha = input('Senha: ')
            novo_usuario = Usuario(nome, email, senha)
            b.criar_conta(novo_usuario)

        elif escolha == 3:
            b.listar_usuarios()

        elif escolha == 4:
            break

        else:
            print('Opção inválida.')
menu()



        

    


        
        