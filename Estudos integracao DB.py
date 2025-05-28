import mysql.connector

# Função para conectar ao banco de dados
def get_db_connection():
    return mysql.connector.connect(
        host='localhost', 
        user='root',  # Seu usuário MySQL
        password='',  # Sua senha MySQL
        database='cadastro_db'
    )

# Função para cadastrar um novo usuário
def cadastrar_usuario(nome, email):
    # Conectar ao banco de dados
    conn = get_db_connection()
    cursor = conn.cursor()

    # Comando SQL para inserir um usuário na tabela
    query = "INSERT INTO usuarios (nome, email) VALUES (%s, %s)"
    cursor.execute(query, (nome, email))

    # Confirmar a inserção e fechar a conexão
    conn.commit()
    cursor.close()
    conn.close()

    print(f"Usuário {nome} cadastrado com sucesso!")

# Função para listar todos os usuários
def listar_usuarios():
    # Conectar ao banco de dados
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Comando SQL para selecionar todos os usuários
    query = "SELECT * FROM usuarios"
    cursor.execute(query)

    # Obter todos os resultados e exibir
    usuarios = cursor.fetchall()
    cursor.close()
    conn.close()

    if usuarios:
        print("\nUsuários cadastrados:")
        for usuario in usuarios:
            print(f"ID: {usuario['id']}, Nome: {usuario['nome']}, Email: {usuario['email']}")
    else:
        print("Nenhum usuário cadastrado.")

# Função principal com o menu interativo
def menu():
    while True:
        print("\n--- Menu ---")
        print("1. Cadastrar usuário")
        print("2. Listar usuários")
        print("3. Sair")
        
        escolha = input("Escolha uma opção: ")

        if escolha == '1':
            nome = input("Digite o nome do usuário: ")
            email = input("Digite o email do usuário: ")
            cadastrar_usuario(nome, email)
        elif escolha == '2':
            listar_usuarios()
        elif escolha == '3':
            print("Saindo...")
            break
        else:
            print("Opção inválida. Tente novamente.")

# Rodando o programa
if __name__ == "__main__":
    menu()
    