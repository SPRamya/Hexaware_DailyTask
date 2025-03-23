create database HMBank;
use HMBank;

--Customers table
create table Customers(
customer_id int primary key,
first_name varchar(50) not null,
last_name varchar(50)not null,
DOB date not null,
email varchar(255) unique not null,
phone_number varchar(15) unique not null,
address varchar(500) not null
);

--Accounts table
create table Accounts(
account_id int primary key,
customer_id int not null
--constraint FK_Accounts_Customer_Id foreign key references Customers(customer_id)
,
account_type varchar(20) check(account_type in ('savings','current','zero_balance')) not null,
balance decimal(18,2) check(balance>=0) not null,
--foreign key(customer_id) references Customers(customer_id) on delete cascade
);

--Transactions table
create table Transactions(
transaction_id int primary key,
account_id int not null,
transaction_type varchar(20) check(transaction_type in ('deposit','withdrawal','transfer')) not null,
amount decimal(18,2) check(amount>0) not null,
transaction_date datetime default getdate(),
foreign key (account_id) references Accounts(account_id) on delete cascade
);