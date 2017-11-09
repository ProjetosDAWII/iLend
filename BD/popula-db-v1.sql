use ilend;

insert into user values 
(1, "", "admin", "admin", 0), 
(2,"","dono","dono",1), 
(3,"","locador1","locador2",1),
(4,"","pessoa1","pessoa1",2);


insert into pessoa values 
(1, "Victor Hugo", "00011122233", "hullopes@hotmail.com", "victorhullopes@gmail.com", "Masc", "1982-07-23", "Ativo")
,(2, "Dono 1", "00111222334", "fulano@hotmail.com", "fulano@gmail.com", "Masc", "1992-07-23", "Ativo")
,(3, "Locador 1", "00211322435", "locador@hotmail.com", "locador@gmail.com", "Masc", "1999-07-23", "Ativo")
,(4, "Pessoa", "00311422536", "pessoa@hotmail.com", "pessoa@gmail.com", "Masc", "2001-07-23", "Ativo");

insert into pessoa_has_user values 
(1, 1)
,(2,2)
,(3,3),(4,4);

insert into social values (null, "https://www.facebook.com/victorhullopes", 1,"Facebook");

insert into preco values (1, 0.0, "Grátis", "Normal", "Ativo", "1% pd");

insert into produto values 
(1, "Produto Teste", "Produto de teste do sistema - Cadastrado via script", 1, "Ativo", 1);

insert into categoria values
(1, "Livros", "Livros para empréstimo", "livros"),
(2, "Ferramentas", "Ferramentas para empréstimo", "ferramentas");

insert into produto_has_categoria values (1, 1);

