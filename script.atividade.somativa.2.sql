select * from mydb.regiao;
insert into mydb.regiao values 
	(10,"Norte", "Quente"),
    (20,"Sul","Frio"),
    (30,"Sudeste","Temperatura mais adequada"), 
    (40, "Nordeste", "Vinho de alto teor alcoolico"),
    (50, "Central", "Vinhos de alta qualidade");
    
select * from mydb.vinho;
insert into mydb.vinho values 
	(4544,"Penanolen","Cabernet Sauvignon",2017,"30% do vinho passou 12 meses em barricas de carvalho",1),
    (65422,"Marqués de Riscal","Tinto",2015,"96% tempranillo 4% graciano",2),
    (1213,"CHÂTEAU SMITH HAUT","Branco",2012,"O mais marcante",3),
	(47854,"Riesling Smaragd","Tannat",2020,"Muito potente",4),
	(5421,"Catena Alta","Malbec",2012, "Fermentacao individual",5);
    
alter table mydb.vinicula
drop column viniculacol;

select * from mydb.vinicula;
insert into mydb.vinicula values
	(1,"Zuccardi Valle de Uco","A melhor do mundo de 2020", 542614410000,"info@zucca.com",10),
    (2,"bodega garzon","A segunda melhor do mundo de 2020", 59842241759 , "info@bodn.com",20),
    (3,"Domäne Wachau", "Um dos melhores vinhos do mundo", 432711371 , "office@dou.at",30),
    (4,"VIÑA MONTES" , "Mais recomendada entre pessoas de classe alta", 56722605195, "montes@m.com",40),
	(5,"robert mondavi winery", "Vinhos de alta clase", 54145121254, "robeact@nes.com",50);
    
-- Faça uma consulta que liste o nome e ano dos  vinhos, incluindo o nome da vinícula e o nome da região que ela pertence.
select * from mydb.vinicula;
select * from mydb.vinho;
select * from mydb.regiao;

select  b.nome_vinho,b.ano_vinho,a.nome_vinicula, a.Regiao_cod_regiao from mydb.vinicula a
 join mydb.vinho b 
 on a.codvinicula = b.Vinicula_codvinicula;
        
        
        
        
-- Crie um usuário Somellier, que deve ter acesso pelo localhost ao Select da tabela Vinho e ao Select do campo codVinicula e nomeVinicula da tabela Vinicula
 -- Além disto, ele somente pode realizar 40 consultas por hora.
 
create user Somellier@"localhost" identified by "1234" with max_connections_per_hour 40 ;
grant select on mydb.vinho to Somellier@"localhost";
 
