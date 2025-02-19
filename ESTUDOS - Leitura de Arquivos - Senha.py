def ler_senhaarq(caminho_arquivo):
    with open(caminho_arquivo,'r',encoding='utf-8') as arquivo:
        senha_arquivo=arquivo.read().strip()
    return senha_arquivo

def verificar_senha(senha_usuario,senha_arquivo):
    return senha_usuario== senha_arquivo

def main():
    caminho_arquivo= 'senha.txt'
    #verificando se o arquivo existe
    import os 
    if not os.path.exists(caminho_arquivo):
        print('Arquivo nao encontrado!')
        return
    senha_arquivo = ler_senhaarq(caminho_arquivo)
    senha_usuario = input('Digite a senha: ').strip()

    if verificar_senha(senha_usuario,senha_arquivo):
        print('Senha correta! Acesso permitido.')
    else:
        print('Senha incorreta! Acesso negado.')
    
main()

