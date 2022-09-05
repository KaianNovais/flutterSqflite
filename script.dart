final createTable = ''' 
CREATE TABLE contact(
id INT PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
telefone CHAR(16) NOT NULL, 
email VARCHAR(150) NOT NULL ,
url_avatar VARCHAR(150) NOT NULL
)
''';

final insertDados = '''
INSERT INTO contact(nome, telefone, email, url_avatar)
VALUES('Julia', '33 9 9957 7227', 'juju@hotmail.com', 'https://img.freepik.com/vetores-premium/o-avatar-do-perfil-de-usuario-feminino-e-uma-mulher-um-personagem-para-um-protetor-de-tela-com-emocoes_505620-617.jpg')
''';