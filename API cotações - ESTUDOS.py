import requests

def obter_cotacao(moedas):
    url = f'https://economia.awesomeapi.com.br/json/last/{moedas}'
    resposta = requests.get(url)
    if resposta.status_code == 200:
        return resposta.json()
    else:
        return None

def exibir_cotacao(cotacao):
    for moeda, info in cotacao.items():
        nome = info['name']
        bid = info['bid']
        print(f"Cotação de {nome}: R$ {bid}")

while True:
    moedas = input("Digite as moedas que deseja consultar (exemplo: USD-BRL,EUR-BRL,BTC-BRL) ou 'sair' para terminar: ")
    if moedas.lower() == 'sair':
        break
    cotacao = obter_cotacao(moedas)
    if cotacao:
        exibir_cotacao(cotacao)
    else:
        print("Não foi possível obter a cotação. Verifique as moedas e tente novamente.")

print("Programa encerrado.")
