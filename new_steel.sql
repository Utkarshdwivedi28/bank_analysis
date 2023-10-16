# What are the names of all the customers who live in New York?

select distinct(concat(firstname,' ',lastname)),city from customers
where city='new york';

# What is the total number of accounts in the Accounts table?

select count(*) from accounts;

# What is the total balance of all checking accounts?

select accounttype,count(accounttype) count,sum(balance) balance from accounts
where accounttype='checking';

# What is the total balance of all accounts associated with customers who live in Los Angeles?

select concat(c.firstname,' ',c.lastname) as full_name,c.city,sum(balance) as balance from accounts a
join customers c on a.customerID=c.customerID
where c.city='Los angeles'
group by full_name;

# Which branch has the highest average account balance?

select branchname,round(avg(balance)) from accounts a
join branches b on a.branchid= b.branchid
group by branchname
order by avg(balance) desc limit 1;

# Which customer has the highest current balance in their accounts?

select concat(c.firstname,' ',c.lastname) as full_name,a.accounttype,sum(a.balance) from accounts a
join customers c on a.customerid=c.customerid
group by full_name
order by a.balance desc limit 1;

# Which customer has made the most transactions in the Transactions table?

select concat(c.firstname,' ',c.lastname) as full_name,count(t.amount) max_count from customers c
join accounts a on c.CustomerID=a.CustomerID
join transactions t on a.AccountID=t.AccountID
group by full_name order by max_count desc;

# Which branch has the highest total balance across all of its accounts?

select b.branchname,sum(a.balance) from accounts a 
join branches b on a.BranchID=b.BranchID
group by 1 order by 2 desc limit 1;

# Showing each branch's total balance across each of its accounts?

 select b.branchname,a.accounttype,sum(a.balance) from accounts a
 join branches b on a.BranchID=b.BranchID
 group by 1,2 order by 1;
 
 # Shows customer's total balance across each of their accounts, including savings and checking accounts?
 
select concat(c.firstname,' ',c.lastname) full_name,a.accounttype,sum(a.balance) t_balance from accounts a 
join customers c on a.CustomerID=c.CustomerID
group by 1,2 order by 3;

# Which customer has the highest total balance across all of their accounts, including savings and checking accounts?

select concat(c.firstname,' ',c.lastname) full_name,sum(a.balance) t_balance from accounts a
join customers c on a.CustomerID=c.CustomerID
group by 1 order by 2 desc limit 1;

# Which branch has the highest number of transactions in the Transactions table?

select b.branchname,count(t.transactiondate) from branches b
join accounts a on a.BranchID=b.BranchID
join transactions t on a.AccountID=t.AccountID
group by 1 order by 2 desc;




