import requests

def obter_dados_pais(pais):
    url = f"https://restcountries.com/v3.1/name/{pais}"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        return None

def exibir_dados_pais(dados_pais):
    if dados_pais:
        pais = dados_pais[0]
        nome = pais['name']['common']
        capital = pais['capital'][0]
        populacao = pais['population']
        regiao = pais['region']
        sub_regiao = pais['subregion']
        idiomas = ', '.join(pais['languages'].values())

        print("Nome:", nome)
        print("Capital:", capital)
        print("População:", populacao)
        print("Região:", regiao)
        print("Sub-região:", sub_regiao)
        print("Idiomas:", idiomas)
    else:
        print("Dados do país não encontrados.")

def menu():
    
    while True:
        print('1. Exibir dados de um país.')
        print('2. Sair.')
        
        op=int(input('O que deseja: '))
        
        if op == 1:
            pais=input('Digite um país: ')
            dados_pais=obter_dados_pais(pais)
            exibir_dados_pais(dados_pais)
        elif op == 2:
            break
        else:
            print('Ação inválida.')

menu()
