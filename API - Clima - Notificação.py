import requests
import time
from plyer import notification 

def obter_clima(cidade):
    url = f"https://wttr.in/{cidade}?format=j1"
    resposta = requests.get(url)
    if resposta.status_code == 200:
        return resposta.json()
    else:
        print(f"Erro na requisição: {resposta.status_code}")
        return None

def analisar_clima(clima):
    temp = int(clima['current_condition'][0]['temp_C'])
    descricao = clima['current_condition'][0]['weatherDesc'][0]['value']
    
    if temp < 20:
        return f"Temperatura: {temp}°C. Está frio! Leve um casaco."
    elif 20 <= temp <= 30:
        return f"Temperatura: {temp}°C. O clima está agradável."
    else:
        return f"Temperatura: {temp}°C. Está quente! Use protetor solar."

def enviar_notificacao(mensagem):
    notification.notify(
        title='Previsão do Tempo',
        message=mensagem,
        timeout=10  # A notificação ficará visível por 10 segundos
    )

def main():
    cidade = input("Digite a cidade para ver a previsão do tempo: ")
    
    clima = obter_clima(cidade)
    
    if clima:
        mensagem = analisar_clima(clima)
        enviar_notificacao(mensagem)
    else:
        print("Não foi possível obter os dados do clima.")

# Rodando a aplicação
if __name__ == "__main__":
    while True:
        main()
        time.sleep(3600)  # A cada hora, o sistema verifica o clima e envia a notificação.
