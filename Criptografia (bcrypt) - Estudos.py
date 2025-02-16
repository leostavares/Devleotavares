import bcrypt #Importa a biblioteca de criptografia
senha_usuario = input('Digite uma senha: ') #Solicita ao usuario que digite uma senha
salt=bcrypt.gensalt() #Gera um salt (valor aleatorio)
senha_criptografada = bcrypt.hashpw(senha_usuario.encode(),salt) #Criptografa a senha gerada pelo usuario
print(f'Senha criptografada: {senha_criptografada}')