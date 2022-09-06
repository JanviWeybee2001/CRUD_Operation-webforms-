--JANVI-DESAI\SQLEXPRESS

use Party_Product;

create table Party_List( 
Party_id int identity(1,1) primary key,
Party_Name nvarchar(50) not null,
);

insert into Party_List values ('Toyota');
insert into Party_List values ('Ford');
insert into Party_List values ('BMW');
insert into Party_List values ('Tesla');
insert into Party_List values ('Lamborghini');

Select * from Party_List order by Party_id;

--Drop table Party_List;

go
create procedure spPartyItem
@party nvarchar(50)
as
begin 
insert into Party_List values (@party)
end;

exec spPartyItem 'Nestle';

go
create procedure spFindDuplicateParty
@party nvarchar(50)
as
begin
select Party_id from Party_List where Party_Name = @party
end;

exec spFindDuplicateParty 'Nestle';

create table Product_List( 
Product_id int identity(1,1) primary key,
Product_Name nvarchar(50) not null,
);

insert into Product_List values ('Innova Crysta');
insert into Product_List values ('Fortuner');
insert into Product_List values ('the Mustang');
insert into Product_List values ('Figo');
insert into Product_List values ('Rolls-Royce');
insert into Product_List values ('BMW Motorrad');
insert into Product_List values ('Tesla Roadster');
insert into Product_List values ('Tesla Semi');
insert into Product_List values ('Lamborghini Aventador');
insert into Product_List values ('Lamborghini Huracán');

Select * from Product_List order by Product_id;

--Drop table Product_List;

go
create procedure spProductItem
@product nvarchar(50)
as
begin 
insert into Product_List values (@product)
end;

exec spProductItem 'KitKat'

go
create procedure spFindDuplicateProduct
@product nvarchar(50)
as
begin
select Product_id from Product_List where Product_Name = @product
end;

delete from Product_List where Product_id=13

create table Party_Product(
Party_Product_id int identity(1,1),
Party_id int foreign key references Party_List(Party_id),
Product_id int foreign key references Product_List(Product_id),
);

insert into Party_Product (Party_id,Product_id) values (1,1);
insert into Party_Product (Party_id,Product_id) values (1,2);
insert into Party_Product (Party_id,Product_id) values (2,3);
insert into Party_Product (Party_id,Product_id) values (2,4);
insert into Party_Product (Party_id,Product_id) values (3,5);
insert into Party_Product (Party_id,Product_id) values (3,6);
insert into Party_Product (Party_id,Product_id) values (4,7);
insert into Party_Product (Party_id,Product_id) values (4,8);
insert into Party_Product (Party_id,Product_id) values (5,9);
insert into Party_Product (Party_id,Product_id) values (5,10);

--drop table Party_Product;

go
create procedure getPartyProduct
as
begin
select Party_Product_id, Party_Name, Product_Name from ((
Party_Product PP 
inner join Party_List PA on PP.Party_id = PA.Party_id)
inner join Product_List PRO on PP.Product_id = PRO.Product_id);
end;

exec getPartyProduct;

--drop procedure getPartyProduct

go
create procedure AssignPartyProduct
@partyid int,
@productid int
as
begin 
insert into Party_Product values (@partyid, @productid)
end;

exec AssignPartyProduct 9, 14

--drop procedure AssignPartyProduct

go
create procedure spDuplicatePartyProduct
@partyid int,
@productid int
as
begin 
select Party_Product_id from Party_Product where Party_id = @partyid AND Product_id = @productid
end

exec spDuplicatePartyProduct 9,14

create table Product_Rate (
Product_Rate_id int identity(1,1),
Product_id int foreign key references Product_List(Product_id),
Rate int,
Date_OF_Rate date 
);

insert into Product_Rate values (1,2000000,'02/11/2001');

select * from Product_Rate;

--drop table Product_Rate;

go
create procedure spgetProductRateItem
@productid int
as
begin
select Product_Rate_id from Product_Rate where  Product_id = @productid 
end

exec spgetProductRateItem 1

--drop procedure spgetProductRateItem

go
create procedure spAddProductRateItem
@productid int,
@rate int,
@date date
as
begin 
insert into Product_Rate (Product_id, Rate, Date_OF_Rate) values (@productid, @rate, @date)
end

exec spAddProductRateItem 2, 1600000, '2011-09-17';

--drop procedure spAddProductRateItem

go
create procedure spUpdateProductRateItem
@productid int,
@rate int,
@date date
as
begin 
update Product_Rate set Rate = @rate, Date_OF_Rate = @date where Product_id = @productid
end

exec spUpdateProductRateItem 2, 1700000,'2011-09-17'


create table Invoice (
invoice_id int identity(1,1),
Party_id int,
Product_id int,
Rate int,
Quantity int,
total int
);

select * from Invoice;

insert into Invoice values (1 , 1, 2000000, 2, 2000000*2);

--drop table Invoice;

Select Product_Rate_id, Product_Name, Rate, Date_OF_Rate from Product_Rate PR join Product_List PRO on PR.Product_id = PRO.Product_id

go
create procedure spGetInvoice
as
Begin
select invoice_id, Party_Name, Product_Name, Rate, Quantity, total 
from ((Invoice I join Product_List Pro on I.Product_id = Pro.Product_id)
inner join Party_List PL on I.Party_id = PL.Party_id)
end;

exec spGetInvoice;

go 
create procedure spAddInvoice
@party int,
@product int,
@rate int,
@quantity int
as
begin 
insert into Invoice values(@party, @product, @rate, @quantity, @rate*@quantity);
end

exec spAddInvoice 2,3,8000000,2;

go
create procedure spGetproductbyPartyId
@party int
as
begin
select Product_Name from Party_Product PP join Product_List PL on PP.Product_id = PL.Product_id where Party_id = @party
end

exec spGetproductbyPartyId 1

drop procedure spGetproductbyPartyId

go
create procedure spGetRate
@party int,
@product int
as
begin
select rate from 
Party_Product PP join Product_Rate PR 
on PP.Product_id=PR.Product_id
where PP.Party_id = @party and PP.Product_id = @product
end;

exec spGetRate 1,2

go
create procedure spDeleteDataInvoice
as
begin
delete from Invoice
end;

delete from Invoice where invoice_id=34

update Party_List set Party_Name = 'Toyoto' where Party_id = 1

update Product_Rate set Product_id = 16, Rate = 250, Date_OF_Rate = '2022-02-02'  where Product_Rate_id = 11





