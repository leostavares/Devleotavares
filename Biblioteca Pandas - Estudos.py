import pandas as pd #importa a biblioteca pandas

estoque=[] #Cria uma lista para depois adicionar um dicionario com chave e valores

while True:
    print('1. Adicionar produtos no estoque.')
    print('2. Exibir estoque. ')
    print('3. Sair')
    
    op = int(input('O que deseja? '))
    
    if op == 1:
        nome=str(input('Digite o nome do produto: '))
        quantidade=int(input('Digite quantos produtos quer adicionar: '))
        preco=float(input('Digite o preço do produto: '))
        estoque.append({
            'Nome': nome,
            'Quantidade': quantidade,
            'Preço': preco
        }) #Adiciona os produtos com suas respectivas informações
    
    elif op == 2:
        if estoque:
            df=pd.DataFrame(estoque) #Cria o data frame dos produtos
            print(df)
        else:
            print('Estoque vazio!')
    
    elif op == 3:
        break

    else:
        print('Ação inválida.')
