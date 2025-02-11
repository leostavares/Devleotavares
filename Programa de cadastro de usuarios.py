import pandas as pd
class Usuario:
    def __init__(self,nome,email,senha):
        self.nome=nome
        self.email=email
        self.senha=senha
    def exibir_usuarios(self):
        print(f'NOME: {self.nome}      EMAIL:{self.email}')
    def atualizar_senha(self,nova_senha):
        self.senha=nova_senha
usuarios=[]
def cadastrar_usuarios():
    nome=input('Digite seu nome: ')
    email=input('Digite seu email: ')
    for usuario in usuarios:
        if usuario.email == email:
            print('Usuario já cadastrado...')
            return
    senha=input('Digite sua senha: ')
    print('Usuario cadastrado com sucesso!!')
    novo_usuario=Usuario(nome,email,senha)
    usuarios.append(novo_usuario)
def exibir_usuarios():
    if not usuarios:
        print('Nenhum usuario cadastrado!')
    else:
        data={
            'Nome':[usuario.nome for usuario in usuarios],
            'Email':[usuario.email for usuario in usuarios]
        }
        df=pd.DataFrame(data)
        print(df)
def atualizar_senha():
    email=input('Digite seu email: ')
    for usuario in usuarios:
        if usuario.email == email:
            senha_antiga=input('Digite sua senha antiga: ')
            if senha_antiga == usuario.senha:
                nova_senha=input('Digite sua nova senha: ')
                print('Senha atualizada com sucesso!!')
                usuario.senha=nova_senha
                return
            else:
                print('Senha antiga incorreta. Tente novamente. ')
    print('Usuario nao cadastrado!!')
def exibir_senha():
    email=input('Digite seu email: ')
    senha=input('Digite sua senha: ')
    for usuario in usuarios:
        if usuario.email == email and usuario.senha == senha:
            data={
                'Email':[usuario.email],
                'senha':[usuario.senha]
            }
            df=pd.DataFrame(data)
            print(df)

def loguin():
    email=input('Digite seu email: ')
    senha=input('Digite sua senha: ')
    for usuario in usuarios:
        if usuario.email == email and usuario.senha == senha:
            print('Loguin efetuado com sucesso!!')
            return True
    print('Credenciais erradas!')
    return False
def menu():
    while True:
        print('MENU')
        print('1. Cadastrar usuario.')
        print('2. Loguin.')
        print('3. Exibir usuarios')
        print('4. Sair.')
        escolha=int(input('O que deseja: '))
        if escolha == 1:
            cadastrar_usuarios()
        elif escolha == 2:
            while True:
                print('1. Atualizar senha.')
                print('2. Exibir minha senha. ')
                print('3. Exibir usuarios. ')
                print('4. Logout.')
                escolha=int(input('Digite sua escolha: '))
                if escolha == 1:
                    atualizar_senha()            
                elif escolha == 2:
                    exibir_senha()
                elif escolha == 3:
                    exibir_usuarios()
                elif escolha == 4:
                    break
                else:
                    print('Ação inválida.')
        elif escolha == 3:
            exibir_usuarios()
        elif escolha == 4:
            break
        else:
            print('Ação invalida.')
menu()
                

        

    