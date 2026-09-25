create database av1;
use av1;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE Professores (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professors(id_professor)
);

CREATE TABLE Matriculas (
    id_aluno INT,
    id_disciplina INT,
    semestre VARCHAR(10),
    PRIMARY KEY (id_aluno, id_disciplina, semestre),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

INSERT INTO Alunos (id_aluno, nome, data_nascimento) VALUES
(1, 'Carlos Silva', '2002-05-14'),
(2, 'Mariana Costa', '2001-09-22'),
(3, 'Fernando Souza', '2003-01-10');

INSERT INTO Professores (id_professor, nome) VALUES
(10, 'Dr. Roberto Almeida'),
(20, 'Dra. Ana Beatriz');

INSERT INTO Disciplinas (id_disciplina, nome_disciplina, id_professor) VALUES
(101, 'Banco de Dados', 10),
(102, 'Estrutura de Dados', 10),
(103, 'Cálculo I', 20);

INSERT INTO Matriculas (id_aluno, id_disciplina, semestre) VALUES
(1, 101, '2026/1'),
(1, 103, '2026/1'),
(2, 101, '2026/1'),
(3, 102, '2026/1');

SELECT 
    A.nome AS Nome_Aluno, 
    D.nome_disciplina AS Disciplina, 
    M.semestre
FROM Matriculas M
INNER JOIN Alunos A ON M.id_aluno = A.id_aluno
INNER JOIN Disciplinas D ON M.id_disciplina = D.id_disciplina;

SELECT 
    D.nome_disciplina AS Disciplina, 
    COUNT(M.id_aluno) AS Total_Alunos
FROM Disciplinas D
LEFT JOIN Matriculas M ON D.id_disciplina = M.id_disciplina
GROUP BY D.nome_disciplina;

SELECT 
    P.nome AS Professor, 
    D.nome_disciplina AS Disciplina
FROM Professores P
INNER JOIN Disciplinas D ON P.id_professor = D.id_professor;

