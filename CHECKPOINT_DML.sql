create database CHECKPOINT_DML;

USE CHECKPOINT_DML;

create table clients (
	customer_id int primary key,
	nom_client varchar (30) not null,
	customer_tel varchar (50) not null,
);

create table produits (
	product_id int primary key,
	nom_produit varchar (50) not null,
	categorie varchar (30) not null,
	prix decimal (10,2) not null,
);

create table commande (
	order_id int primary key,
	customer_id int not null,
	product_id int not null,
	quantit� int not null,
	order_date date not null,
	constraint fk_customer_id foreign key (customer_id) references clients (customer_id),
	constraint fk_product_id foreign key (product_id) references produits (product_id)
);

-- �crivez les requ�tes SQL appropri�es pour ins�rer tous les enregistrements fournis dans leurs tables correspondantes

insert into clients
(customer_id, nom_client, customer_tel)
values (1, 'Ahmed', 'Tunisie'),
(2, 'Coulibaly', 'S�n�gal'),
(3, 'Hasan', '�gypte'),
(4, 'Yasmine', 'Maroc'),
(5, 'John', 'France'),
(6, 'Fatima', 'Alg�rie');

insert into produits
(product_id, nom_produit, categorie, prix)
values (1, 'Biscuits', 'Snacks', 10), 
(2, 'Bonbons', 'Bonbons', 5.2),
(3, 'Chips', 'Snacks', 8.5),
(4, 'Jus', 'Boissons', 15),
(5, 'Glace', 'Desserts', 12);

insert into commande
(order_id, customer_id, product_id, quantit�, order_date)
values (1, 1, 2, 3, '2023-01-22'),
(2, 2, 1, 10, '2023-04-14'),
(3, 3, 4, 5, '2023-06-10'),
(4, 5, 3, 7, '2023-07-05'),
(5, 6, 5, 2, '2023-10-15');

-- Mettez � jour la quantit� de la deuxi�me commande, la nouvelle valeur devrait �tre 6.

update commande
set quantit� = 6
where order_id = 2;

--Supprimez le troisi�me client de la table des clients.

delete from clients
where customer_id = 3;

