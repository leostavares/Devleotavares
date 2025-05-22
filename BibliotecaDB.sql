-- Criação do banco de dados
CREATE DATABASE BibliotecaDB;
USE BibliotecaDB;

-- Tabela de Alunos
CREATE TABLE Alunos (
    AlunoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Tabela de Professores
CREATE TABLE Professores (
    ProfessorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Tabela de Categorias
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100)
);

-- Tabela de Livros
CREATE TABLE Livros (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100),
    Estoque INT,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabela de Autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Nacionalidade VARCHAR(50),
    Data_Nascimento DATE
);

-- Tabela de Livro_Autor
CREATE TABLE Livro_Autor (
    LivroID INT,
    AutorID INT,
    PRIMARY KEY (LivroID, AutorID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- Tabela de Empréstimos para Alunos
CREATE TABLE Emprestimo_Aluno (
    EmprestimoID INT PRIMARY KEY AUTO_INCREMENT,
    LivroID INT,
    AlunoID INT,
    Data_Emprestimo DATE,
    Data_Devolucao DATE,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID)
);

-- Tabela de Empréstimos para Professores
CREATE TABLE Emprestimo_Professor (
    EmprestimoID INT PRIMARY KEY AUTO_INCREMENT,
    LivroID INT,
    ProfessorID INT,
    Data_Emprestimo DATE,
    Data_Devolucao DATE,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (ProfessorID) REFERENCES Professores(ProfessorID)
);

CREATE TABLE Livro_Categoria (
    LivroID INT,
    CategoriaID INT,
    PRIMARY KEY (LivroID, CategoriaID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Inserindo categorias de livros
INSERT INTO Categorias (CategoriaID, Nome) 
VALUES (1, 'Matemática'),
       (2, 'Ciências'),
       (3, 'Literatura'),
       (4, 'História'),
       (5, 'Tecnologia'),
       (6, 'Ficção'),
       (7, 'Sátira');
       
-- Inserindo 50 livros da categoria Matemática com títulos mais específicos
INSERT INTO Livros (Titulo, Estoque, CategoriaID)
VALUES 
('Cálculo Diferencial e Integral de várias variáveis', 10, 1),
('Álgebra Linear e suas Aplicações', 8, 1),
('Geometria Analítica e Álgebra Linear', 12, 1),
('Matemática Discreta', 7, 1),
('Introdução à Teoria dos Números', 9, 1),
('Cálculo de Variáveis', 5, 1),
('Probabilidade e Estatística para Engenharia', 11, 1),
('Matemática para Economistas', 6, 1),
('Teoria dos Conjuntos', 10, 1),
('Cálculo em Uma Variável', 13, 1),
('Fundamentos de Matemática para Ciências da Computação', 8, 1),
('Matemática para Ciências Naturais', 10, 1),
('Análise Real', 6, 1),
('Álgebra Abstrata', 15, 1),
('Matemática: Modelagem e Aplicações', 10, 1),
('Teoria das Funções', 9, 1),
('Geometria Euclidiana e Não Euclidiana', 8, 1),
('Cálculo para Engenharia', 12, 1),
('Álgebra e Teoria dos Grupos', 7, 1),
('Equações Diferenciais para Ciências e Engenharia', 5, 1),
('Matemática Financeira', 10, 1),
('Teoria da Probabilidade', 6, 1),
('Análise Complexa', 11, 1),
('Matemática para Físicos', 7, 1),
('Geometria Diferencial', 9, 1),
('Métodos Numéricos para Engenharia', 12, 1),
('Álgebra Linear Computacional', 8, 1),
('Teoria das Séries e Transformadas', 10, 1),
('Cálculo Numérico e Análise de Algoritmos', 13, 1),
('Análise Funcional', 14, 1),
('Matemática Computacional', 7, 1),
('Métodos Matemáticos para Modelagem de Sistemas', 6, 1),
('Teoria dos Grafos', 9, 1),
('Equações Diferenciais Parciais', 10, 1),
('Geometria Algébrica', 8, 1),
('Teoria de Categorias', 5, 1),
('Topologia e Geometria Diferencial', 10, 1),
('Introdução à Análise Complexa', 11, 1),
('Combinatória e Teoria dos Grafos', 13, 1),
('Teoria da Medida e Integração', 15, 1),
('Geometria Algébrica e Teoria das Representações', 10, 1),
('Métodos de Otimização', 8, 1),
('Cálculo Estocástico e Processos Estocásticos', 6, 1),
('Teoria da Informação e Codificação', 9, 1),
('Matemática em Física Teórica', 13, 1),
('Lógica Matemática e Fundamentos da Computação', 12, 1),
('Matemática Discreta e Algoritmos', 7, 1),
('História da Matemática: De Arquimedes a Poincaré', 6, 1),
('Análise Numérica para Engenharia', 8, 1),
('Matemática e Filosofia: Pensamento Crítico e Lógico', 9, 1),
('Geometria Algebraica e Álgebra Comutativa', 11, 1),
('Teoria das Categorias e Algébras', 7, 1);

-- Inserindo 50 livros da categoria Ciências com títulos mais específicos
INSERT INTO Livros (Titulo, Estoque, CategoriaID)
VALUES 
('Fundamentos de Biologia Molecular', 10, 2),
('Química Orgânica: Princípios e Aplicações', 8, 2),
('Física Moderna e suas Aplicações', 12, 2),
('Introdução à Genética e Biotecnologia', 7, 2),
('Astronomia: O Universo e suas Estrelas', 9, 2),
('Evolução e Seleção Natural', 5, 2),
('Física Quântica para Iniciantes', 11, 2),
('Química Inorgânica: Teorias e Práticas', 6, 2),
('Ecologia e Sustentabilidade Ambiental', 10, 2),
('Princípios de Termodinâmica', 13, 2),
('Bioquímica: Fundamentos e Aplicações', 8, 2),
('Introdução à Ciência dos Materiais', 10, 2),
('Neurociências e Comportamento Humano', 6, 2),
('Física Experimental', 15, 2),
('Genética Evolutiva', 10, 2),
('Física e Química da Matéria Condensada', 9, 2),
('Química Ambiental', 8, 2),
('Ciências da Terra: Geologia e Geofísica', 12, 2),
('Introdução à Biologia Celular', 7, 2),
('Ciência dos Alimentos: Processos e Tecnologias', 5, 2),
('Princípios de Biotecnologia', 10, 2),
('Física do Estado Sólido', 6, 2),
('Introdução à Meteorologia e Climatologia', 11, 2),
('Biologia Marinha: Ecossistemas e Biodiversidade', 7, 2),
('Biofísica: Fundamentos e Aplicações', 9, 2),
('Química Analítica: Técnicas e Métodos', 13, 2),
('Ciência e Tecnologia de Polímeros', 14, 2),
('Microbiologia para Ciências da Saúde', 7, 2),
('Física Nuclear e Aplicações', 6, 2),
('Química Física: Teoria e Aplicações', 9, 2),
('Ciência do Solo: Fundamentos e Aplicações', 13, 2),
('Técnicas de Laboratório em Ciências Biológicas', 10, 2),
('Biologia Evolutiva e Diversidade', 8, 2),
('Geometria Espacial e suas Aplicações', 6, 2),
('Matemática Aplicada às Ciências Naturais', 9, 2),
('Ciências Forenses: Fundamentos e Práticas', 7, 2),
('Astronomia e Cosmologia: Teorias Contemporâneas', 11, 2),
('Princípios de Química Analítica Ambiental', 10, 2),
('Física de Partículas e Campos', 8, 2),
('Biologia Ambiental e Sustentabilidade', 12, 2),
('Fundamentos de Psicologia Experimental', 6, 2),
('Ciência e Tecnologia de Alimentos Funcionais', 9, 2),
('Ecossistemas e Conservação Ambiental', 10, 2),
('Imunologia: Fundamentos e Aplicações', 7, 2),
('Toxicologia Ambiental', 6, 2),
('Química Medicinal: Principais Compostos e Aplicações', 11, 2),
('Ciências Biomédicas: Pesquisa e Desenvolvimento', 13, 2),
('Bioinformática e Biologia Computacional', 8, 2),
('Ciência e Tecnologias de Alimentos Funcionais', 9, 2),
('Química Experimental e suas Aplicações', 7, 2),
('Física para Engenharia e Ciências Aplicadas', 5, 2);

-- Inserindo 50 livros da categoria Literatura com títulos mais específicos
INSERT INTO Livros (Titulo, Estoque, CategoriaID)
VALUES 
('Dom Casmurro', 12, 3),
('Memórias Póstumas de Brás Cubas', 8, 3),
('Grande Sertão: Veredas', 15, 3),
('O Primo Basílio', 9, 3),
('A Moreninha', 10, 3),
('Iracema', 7, 3),
('O Cortiço', 14, 3),
('Senhora', 11, 3),
('O Guarani', 10, 3),
('O Mulato', 6, 3),
('A Moreninha', 5, 3),
('Vidas Secas', 12, 3),
('O Ateneu', 8, 3),
('O Alienista', 13, 3),
('O Primo Basílio', 9, 3),
('A Divina Comédia', 15, 3),
('O Retrato de Dorian Gray', 10, 3),
('1984', 11, 3),
('Orgulho e Preconceito', 9, 3),
('Dom Quixote', 13, 3),
('A Metamorfose', 7, 3),
('Crime e Castigo', 10, 3),
('Cem Anos de Solidão', 8, 3),
('A Ilha do Tesouro', 12, 3),
('Drácula', 6, 3),
('O Grande Gatsby', 14, 3),
('As Aventuras de Sherlock Holmes', 11, 3),
('Frankenstein', 10, 3),
('O Senhor dos Anéis', 15, 3),
('Harry Potter e a Pedra Filosofal', 8, 3),
('O Hobbit', 7, 3),
('As Crônicas de Nárnia', 12, 3),
('O Pequeno Príncipe', 6, 3),
('O Diário de Anne Frank', 9, 3),
('O Morro dos Ventos Uivantes', 8, 3),
('O Conde de Monte Cristo', 13, 3),
('A Tragédia de Hamlet', 10, 3),
('O Médico e o Monstro', 9, 3),
('O Lobo da Estepe', 11, 3),
('Laranja Mecânica', 10, 3),
('A Arte da Guerra', 5, 3),
('O Processo', 8, 3),
('A Peste', 7, 3),
('O Mestre e Margarida', 13, 3),
('O Jovem Werther', 9, 3),
('O Último dos Moicanos', 11, 3),
('Fahrenheit 451', 10, 3),
('Ligações Perigosas', 6, 3),
('Os Miseráveis', 14, 3),
('O Capote', 7, 3),
('As Vidas de Tóquio', 9, 3);

-- Inserindo 50 livros da categoria História com títulos mais específicos
INSERT INTO Livros (Titulo, Estoque, CategoriaID)
VALUES 
('A História das Guerras Napoleônicas', 10, 4),
('O Império Romano: Ascensão e Queda', 12, 4),
('A Segunda Guerra Mundial', 14, 4),
('A História do Brasil: Da Colônia à República', 9, 4),
('A Revolução Francesa', 10, 4),
('A Guerra Fria: Origens e Consequências', 8, 4),
('O Holocausto: História e Memória', 11, 4),
('A Idade Média: Sociedade e Cultura', 10, 4),
('A História da China Antiga', 7, 4),
('História do Antigo Egito', 15, 4),
('A Revolução Industrial', 13, 4),
('A Primeira Guerra Mundial', 9, 4),
('A História do Egito Ptolemaico', 10, 4),
('A História da Grécia Antiga', 12, 4),
('A História da Inglaterra: Do Medieval ao Moderno', 8, 4),
('A Ascensão do Fascismo na Europa', 11, 4),
('A História dos Estados Unidos: De 1492 a 1865', 7, 4),
('O Império Bizantino: A Herança Romana', 9, 4),
('A História do Japão Feudal', 10, 4),
('A Era das Descobertas', 13, 4),
('A História da Primeira República Brasileira', 8, 4),
('O Império Otomano: Expansão e Declínio', 12, 4),
('O Renascimento e a Idade Moderna', 14, 4),
('A História da Revolução Russa', 10, 4),
('A História do Império Mongol', 9, 4),
('O Século XIX: Transformações e Conflitos', 11, 4),
('A Inquisição e os Processos Judiciais', 7, 4),
('A História do Cristianismo', 12, 4),
('A História da Guerra do Vietnã', 8, 4),
('A História do Império Franco', 10, 4),
('O Colonialismo e seus Efeitos no Mundo Moderno', 15, 4),
('A História da Revolução Mexicana', 6, 4),
('A História da Civilização Maia', 14, 4),
('A História do Mundo Antigo', 10, 4),
('A Era Napoleônica: Conflitos e Consequências', 9, 4),
('A História da Europa Medieval', 7, 4),
('A História do Império Asteca', 11, 4),
('A História do Império Persa', 13, 4),
('O Legado do Império Romano', 8, 4),
('A História da África Antiga', 12, 4),
('O Império Carolíngio e seus Sucessores', 9, 4),
('A Expansão do Império Espanhol', 10, 4),
('A Revolução Americana: Causas e Consequências', 11, 4),
('A História da Primeira República Francesa', 12, 4),
('A História do Império Inca', 10, 4),
('A História da Guerra Civil Americana', 14, 4),
('A Ascensão do Nacionalismo na Europa', 8, 4),
('A História da Expansão Europeia no Século XVI', 13, 4),
('A História da Dinastia Qing na China', 9, 4),
('A História do Império Alemão', 12, 4),
('A História das Cruzadas', 7, 4),
('A História da União Soviética', 10, 4),
('A História do México Pré-Colombiano', 8, 4);

-- Inserindo 50 livros da categoria Tecnologia com títulos mais específicos
INSERT INTO Livros (Titulo, Estoque, CategoriaID)
VALUES 
('Introdução à Ciência da Computação', 10, 5),
('Fundamentos de Redes de Computadores', 12, 5),
('Desenvolvimento de Software Ágil', 14, 5),
('Inteligência Artificial: Estruturas e Algoritmos', 9, 5),
('Redes de Computadores: Princípios e Protocolos', 10, 5),
('Algoritmos e Estruturas de Dados', 15, 5),
('Banco de Dados: Teoria e Prática', 13, 5),
('Sistemas Operacionais: Conceitos e Desafios', 8, 5),
('Cibersegurança: Protegendo Sistemas e Dados', 11, 5),
('Engenharia de Software: Métodos e Ferramentas', 9, 5),
('Programação Orientada a Objetos com Java', 10, 5),
('Introdução à Programação em Python', 7, 5),
('Aprendizado de Máquina: Teoria e Aplicações', 12, 5),
('Redes Neurais Artificiais: Fundamentos e Aplicações', 14, 5),
('Banco de Dados NoSQL: Conceitos e Aplicações', 10, 5),
('Desenvolvimento Web com HTML, CSS e JavaScript', 13, 5),
('DevOps: Cultura e Práticas', 11, 5),
('Engenharia de Requisitos: Princípios e Técnicas', 8, 5),
('Arquitetura de Sistemas: Do Design à Implementação', 15, 5),
('Computação em Nuvem: Fundamentos e Aplicações', 9, 5),
('Programação Funcional em Scala', 12, 5),
('Construindo Aplicações com Node.js', 10, 5),
('Desenvolvimento de Apps para Android', 7, 5),
('Desenvolvimento de Software Seguro', 8, 5),
('Análise e Projeto de Sistemas', 13, 5),
('Estruturas de Dados Avançadas em C++', 10, 5),
('Estruturas de Dados em Java', 12, 5),
('IoT: Internet das Coisas - Teoria e Prática', 9, 5),
('Desenvolvimento de Jogos Digitais: Fundamentos', 11, 5),
('Processamento de Linguagem Natural: Teoria e Aplicações', 8, 5),
('Desenvolvimento de Software para Big Data', 14, 5),
('Computação Quântica: Fundamentos e Aplicações', 7, 5),
('Blockchain: Conceitos e Aplicações', 10, 5),
('Metodologias Ágeis em Projetos de Software', 9, 5),
('Análise de Dados com Python', 15, 5),
('Programação para IoT com Raspberry Pi', 13, 5),
('Deep Learning: Fundamentos e Aplicações', 8, 5),
('Técnicas de Testes de Software', 10, 5),
('Gestão de Projetos de TI', 12, 5),
('Sistemas de Recomendação: Fundamentos e Aplicações', 7, 5),
('Arquitetura de Microserviços', 14, 5),
('Desenvolvimento de Aplicações com Flutter', 11, 5),
('Segurança de Redes e Protocolos', 9, 5),
('Sistemas Distribuídos: Teoria e Prática', 10, 5),
('Fundamentos de Computação Gráfica', 13, 5),
('Engenharia de Software para Ambientes Distribuídos', 8, 5),
('Cloud Computing: Conceitos e Práticas', 14, 5),
('Desenvolvimento de APIs RESTful', 10, 5),
('Análise de Algoritmos: Teoria e Prática', 11, 5),
('Linux: Conceitos e Administração de Sistemas', 7, 5),
('Data Science: Fundamentos e Aplicações', 12, 5);

INSERT INTO Alunos (Nome, Email, Telefone) VALUES
('Ana Oliveira', 'ana.oliveira@email.com', '98981112233'),
('Carlos Souza', 'carlos.souza@email.com', '98982223344'),
('Fernanda Lima', 'fernanda.lima@email.com', '98983334455'),
('Rafael Costa', 'rafael.costa@email.com', '98984445566'),
('Juliana Martins', 'juliana.martins@email.com', '98985556677');

INSERT INTO Professores (Nome, Email, Telefone) VALUES
('Dr. Marcos Pereira', 'marcos.pereira@email.com', '98986667788'),
('Profa. Helena Rocha', 'helena.rocha@email.com', '98987778899'),
('Prof. Lucas Almeida', 'lucas.almeida@email.com', '98988889900');

-- Inserindo Alunos
INSERT INTO Alunos (Nome, Email, Telefone) VALUES
('Carlos Silva', 'carlos.silva@email.com', '991234567'),
('João Pereira', 'joao.pereira@email.com', '992345678'),
('Maria Oliveira', 'maria.oliveira@email.com', '993456789'),
('Ana Costa', 'ana.costa@email.com', '994567890'),
('Pedro Santos', 'pedro.santos@email.com', '995678901'),
('Lucas Lima', 'lucas.lima@email.com', '996789012'),
('Beatriz Almeida', 'beatriz.almeida@email.com', '997890123'),
('Rafael Souza', 'rafael.souza@email.com', '998901234'),
('Patrícia Alves', 'patricia.alves@email.com', '999012345'),
('Vinícius Rocha', 'vinicius.rocha@email.com', '991234567');

-- Inserindo Professores
INSERT INTO Professores (Nome, Email, Telefone) VALUES
('Prof. Marcos Ribeiro', 'marcos.ribeiro@email.com', '992233445'),
('Prof. Clara Souza', 'clara.souza@email.com', '993344556'),
('Prof. João Batista', 'joao.batista@email.com', '994455667'),
('Prof. Renata Lima', 'renata.lima@email.com', '995566778'),
('Prof. Henrique Almeida', 'henrique.almeida@email.com', '996677889');

-- Inserir Empréstimos de Alunos
INSERT INTO Emprestimo_Aluno (LivroID, AlunoID, Data_Emprestimo,
 Data_Devolucao) VALUES
(1, 1, '2025-04-01', '2025-04-15'), -- Livro 1 emprestado para Aluno 1
(2, 2, '2025-04-02', '2025-04-16'), -- Livro 2 emprestado para Aluno 2
(3, 3, '2025-04-05', '2025-04-20'), -- Livro 3 emprestado para Aluno 3
(4, 4, '2025-04-10', '2025-04-24'), -- Livro 4 emprestado para Aluno 4
(5, 5, '2025-04-12', '2025-04-26'), -- Livro 5 emprestado para Aluno 5
(6, 6, '2025-04-13', '2025-04-27'), -- Livro 6 emprestado para Aluno 6
(7, 7, '2025-04-15', '2025-04-29'), -- Livro 7 emprestado para Aluno 7
(8, 8, '2025-04-17', '2025-05-01'), -- Livro 8 emprestado para Aluno 8
(9, 9, '2025-04-18', '2025-05-02'), -- Livro 9 emprestado para Aluno 9
(10, 10, '2025-04-20', '2025-05-04'); -- Livro 10 emprestado para Aluno 10

-- Inserir Empréstimos de Professores
INSERT INTO Emprestimo_Professor (LivroID, ProfessorID, Data_Emprestimo, Data_Devolucao) VALUES
(11, 1, '2025-04-01', '2025-04-14'), -- Livro 11 emprestado para Professor 1
(12, 2, '2025-04-03', '2025-04-17'), -- Livro 12 emprestado para Professor 2
(13, 3, '2025-04-06', '2025-04-20'), -- Livro 13 emprestado para Professor 3
(14, 4, '2025-04-07', '2025-04-21'), -- Livro 14 emprestado para Professor 4
(15, 5, '2025-04-09', '2025-04-23'), -- Livro 15 emprestado para Professor 5
(16, 1, '2025-04-10', '2025-04-24'), -- Livro 16 emprestado para Professor 1
(17, 2, '2025-04-11', '2025-04-25'), -- Livro 17 emprestado para Professor 2
(18, 3, '2025-04-12', '2025-04-26'), -- Livro 18 emprestado para Professor 3
(19, 4, '2025-04-14', '2025-04-28'), -- Livro 19 emprestado para Professor 4
(20, 5, '2025-04-15', '2025-04-29'); -- Livro 20 emprestado para Professor 5

-- Inserir mais empréstimos de alunos
INSERT INTO Emprestimo_Aluno (LivroID, AlunoID, Data_Emprestimo, Data_Devolucao)
VALUES 
(1, 1, '2025-04-10', NULL),
(2, 2, '2025-04-12', NULL),
(3, 3, '2025-04-14', '2025-04-21'),
(4, 4, '2025-04-10', NULL),
(5, 5, '2025-04-15', '2025-04-20'),
(6, 6, '2025-04-16', NULL),
(7, 7, '2025-04-18', '2025-04-25'),
(8, 8, '2025-04-19', NULL);

-- Inserir mais empréstimos de professores
INSERT INTO Emprestimo_Professor (LivroID, ProfessorID, Data_Emprestimo, Data_Devolucao)
VALUES
(9, 1, '2025-04-05', '2025-04-12'),
(10, 2, '2025-04-06', NULL),
(11, 3, '2025-04-07', '2025-04-14'),
(12, 4, '2025-04-08', NULL),
(13, 5, '2025-04-09', '2025-04-16');

-- Inserindo empréstimos de livros para professores nas categorias Matemática, Ciências, História, Literatura e Tecnologia
INSERT INTO Emprestimo_Professor (LivroID, ProfessorID, Data_Emprestimo, Data_Devolucao)
VALUES 
-- Categoria Matemática
(1, 1, '2025-04-30', '2025-05-07'),
(2, 2, '2025-04-30', '2025-05-07'),
(3, 3, '2025-04-30', '2025-05-07'),
(4, 4, '2025-04-30', '2025-05-07'),
(5, 5, '2025-04-30', '2025-05-07'),
-- Categoria Ciências
(51, 1, '2025-04-30', '2025-05-07'),
(52, 2, '2025-04-30', '2025-05-07'),
(53, 3, '2025-04-30', '2025-05-07'),
(54, 4, '2025-04-30', '2025-05-07'),
(55, 5, '2025-04-30', '2025-05-07'),
-- Categoria Literatura
(101, 1, '2025-04-30', '2025-05-07'),
(102, 2, '2025-04-30', '2025-05-07'),
(103, 3, '2025-04-30', '2025-05-07'),
(104, 4, '2025-04-30', '2025-05-07'),
(105, 5, '2025-04-30', '2025-05-07'),
-- Categoria História
(151, 1, '2025-04-30', '2025-05-07'),
(152, 2, '2025-04-30', '2025-05-07'),
(153, 3, '2025-04-30', '2025-05-07'),
(154, 4, '2025-04-30', '2025-05-07'),
(155, 5, '2025-04-30', '2025-05-07'),
-- Categoria Tecnologia
(201, 1, '2025-04-30', '2025-05-07'),
(202, 2, '2025-04-30', '2025-05-07'),
(203, 3, '2025-04-30', '2025-05-07'),
(204, 4, '2025-04-30', '2025-05-07'),
(205, 5, '2025-04-30', '2025-05-07');

-- Inserindo empréstimos de livros para alunos nas categorias Matemática, Ciências, História, Literatura e Tecnologia
INSERT INTO Emprestimo_Aluno (LivroID, AlunoID, Data_Emprestimo, Data_Devolucao)
VALUES
-- Categoria Matemática
(1, 1, '2025-04-30', '2025-05-07'),
(2, 2, '2025-04-30', '2025-05-07'),
(3, 3, '2025-04-30', '2025-05-07'),
(4, 4, '2025-04-30', '2025-05-07'),
(5, 5, '2025-04-30', '2025-05-07'),
-- Categoria Ciências
(51, 1, '2025-04-30', '2025-05-07'),
(52, 2, '2025-04-30', '2025-05-07'),
(53, 3, '2025-04-30', '2025-05-07'),
(54, 4, '2025-04-30', '2025-05-07'),
(55, 5, '2025-04-30', '2025-05-07'),
-- Categoria Literatura
(101, 1, '2025-04-30', '2025-05-07'),
(102, 2, '2025-04-30', '2025-05-07'),
(103, 3, '2025-04-30', '2025-05-07'),
(104, 4, '2025-04-30', '2025-05-07'),
(105, 5, '2025-04-30', '2025-05-07'),
-- Categoria História
(151, 1, '2025-04-30', '2025-05-07'),
(152, 2, '2025-04-30', '2025-05-07'),
(153, 3, '2025-04-30', '2025-05-07'),
(154, 4, '2025-04-30', '2025-05-07'),
(155, 5, '2025-04-30', '2025-05-07'),
-- Categoria Tecnologia
(201, 1, '2025-04-30', '2025-05-07'),
(202, 2, '2025-04-30', '2025-05-07'),
(203, 3, '2025-04-30', '2025-05-07'),
(204, 4, '2025-04-30', '2025-05-07'),
(205, 5, '2025-04-30', '2025-05-07');

-- Inserindo empréstimos para 5 alunos com mais de 3 empréstimos cada (empréstimos variados)
INSERT INTO Emprestimo_Aluno (LivroID, AlunoID, Data_Emprestimo, Data_Devolucao)
VALUES
-- Aluno 1 (5 empréstimos)
(1, 1, '2025-04-30', '2025-05-07'),   -- Matemática
(2, 1, '2025-04-30', '2025-05-07'),   -- Matemática
(102, 1, '2025-04-30', '2025-05-07'), -- Literatura
(153, 1, '2025-04-30', '2025-05-07'), -- História
(201, 1, '2025-04-30', '2025-05-07'), -- Tecnologia
-- Aluno 2 (4 empréstimos)
(51, 2, '2025-04-30', '2025-05-07'),  -- Ciências
(52, 2, '2025-04-30', '2025-05-07'),  -- Ciências
(103, 2, '2025-04-30', '2025-05-07'), -- Literatura
(151, 2, '2025-04-30', '2025-05-07'), -- História
-- Aluno 3 (5 empréstimos)
(202, 3, '2025-04-30', '2025-05-07'), -- Tecnologia
(203, 3, '2025-04-30', '2025-05-07'), -- Tecnologia
(104, 3, '2025-04-30', '2025-05-07'), -- Literatura
(54, 3, '2025-04-30', '2025-05-07'),  -- Ciências
(153, 3, '2025-04-30', '2025-05-07'), -- História
-- Aluno 4 (5 empréstimos)
(4, 4, '2025-04-30', '2025-05-07'),   -- Matemática
(5, 4, '2025-04-30', '2025-05-07'),   -- Matemática
(202, 4, '2025-04-30', '2025-05-07'), -- Tecnologia
(101, 4, '2025-04-30', '2025-05-07'), -- Literatura
(53, 4, '2025-04-30', '2025-05-07'),  -- Ciências
-- Aluno 5 (4 empréstimos)
(51, 5, '2025-04-30', '2025-05-07'),  -- Ciências
(152, 5, '2025-04-30', '2025-05-07'), -- História
(203, 5, '2025-04-30', '2025-05-07'), -- Tecnologia
(101, 5, '2025-04-30', '2025-05-07'); -- Literatura







-- Total de livros emprestados por aluno
SELECT A.Nome AS Aluno, COUNT(E.EmprestimoID) AS Total_Emprestimos
FROM Emprestimo_Aluno E
JOIN Alunos A ON E.AlunoID = A.AlunoID
GROUP BY A.Nome; 

-- Total de livros emprestados por professor
SELECT P.Nome AS Professor, COUNT(E.EmprestimoID) AS Total_Emprestimos
FROM Emprestimo_Professor E
JOIN Professores P ON E.ProfessorID = P.ProfessorID
GROUP BY P.Nome; 

-- Livros mais emprestados (alunos e professores)
SELECT L.Titulo, COUNT(E.EmprestimoID) AS Total_Emprestimos
FROM Livros L

JOIN (
    SELECT LivroID, EmprestimoID FROM Emprestimo_Aluno
    UNION ALL
    SELECT LivroID, EmprestimoID FROM Emprestimo_Professor
) E ON L.LivroID = E.LivroID
GROUP BY L.Titulo 
ORDER BY Total_Emprestimos DESC; 

-- Livros com estoque abaixo de 5
SELECT L.Titulo, L.Estoque, C.Nome AS Categoria
FROM Livros L
JOIN Categorias C ON L.CategoriaID = C.CategoriaID
WHERE L.Estoque < 5;

-- Alunos com mais de 3 empréstimos em aberto
SELECT A.Nome AS Aluno, COUNT(E.EmprestimoID) AS Emprestimos_Em_Aberto
FROM Emprestimo_Aluno E
JOIN Alunos A ON E.AlunoID = A.AlunoID
WHERE E.Data_Devolucao IS NULL  
GROUP BY A.Nome 
HAVING COUNT(E.EmprestimoID) > 3;  

-- Alunos que nao devolveram o livro ainda
SELECT L.Titulo, A.Nome AS Aluno, E.Data_Emprestimo
FROM Emprestimo_Aluno E
JOIN Livros L ON E.LivroID = L.LivroID
JOIN Alunos A ON E.AlunoID = A.AlunoID
WHERE E.Data_Devolucao IS NULL;
  
-- Todos livros em estoque
SELECT Titulo, Estoque
FROM Livros
WHERE Estoque > 0;



