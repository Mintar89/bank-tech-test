## Bank Tech Test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Installation

* Clone the repo
* Run bundle install
* Run rspec to test
* Run irb in your terminal to manually test the code, see example output below:

```
3.0.0 :001 > require './lib/bank_account'
 => true 
 => #<BankAccount:0x00007fae75a5c550 @balance=0, @zero_balance=0, @transaction=Transaction, @transactions... 
3.0.0 :003 > bank_account.deposit(1000)
 => [#<Transaction:0x00007fae75953cf8 @credit=1000, @debit=0, @current_balance=1000, @date="03/06/2021">] 
 => [#<Transaction:0x00007fae75953cf8 @credit=1000, @debit=0, @current_balance=1000, @date="03/06/2021">, #<Transaction:0x00007fae75acf500 @credit=2000, @debit=0, @current_balance=3000, @date="03/06/2021">] 
3.0.0 :005 > bank_account.withdraw(500)
 => [#<Transaction:0x00007fae75953cf8 @credit=1000, @debit=0, @current_balance=1000, @date="03/06/2021">, #<Transaction:0x00007fae75acf500 @credit=2000, @debit=0, @current_balance=3000, @date="03/06/2021">, #<Transaction:0x00007fae75a1f0d8 @credit=0, @debit=500, @current_balance=2500, @date="03/06/2021">] 
3.0.0 :006 > bank_account.print_statement
date || credit || debit || balance
03/06/2021 || 0.00 || 500.00 || 2500.00
03/06/2021 || 2000.00 || 0.00 || 3000.00
03/06/2021 || 1000.00 || 0.00 || 1000.00
```


### User Stories

```
As a user
So I can manage my personal finances
I would like to open a bank account
```

```
As a user 
So I can keep my money safe
I would like to place a deposit to my account
```

```
As a user
So I can remove money from my bank account
I would like to make a withdrawal 
```

```
As a user
So I can see my account history
I would like to print my bank statement 
```

```
As a user
So I am not overdrawn
I want my account to prevent withdrawal if I have insufficient funds
```
### Aproach and code structure

* I started by writing user stories according to the requirements
* I then decided on how many classes the program will have and their resposibilities 
* Bank account class is responsible for updating the account balance and creates transactions
* Transaction class is responsible for storing information on transactions 
* Printer class is responsible for formatting and printing statements







