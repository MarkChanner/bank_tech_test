# Bank tech test

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
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

## User Stories

```
As a client,
So that I can make a deposit into my account,
I'd like to deposit money.
```

```
As a client,
So that I can make a withdrawal from my account,
I'd like to withdraw money.
```

```
As a client
So that I can see my balance and recent activity
I'd like to be able to print my statement
```

## Functional Representation based on User Stories

| Objects | Messages        |
| ------- | --------------- |
| Account |
|         | make_deposit    |
|         | make_withdrawal |
|         | print_statement |

## Running The Program from IRB

```
require './lib/account'
require './lib/statement'
require './lib/transaction_log'
require './lib/transaction'

account = Account.new
account.make_deposit 100.00
account.make_withdrawal 50.00
account.print_statement
```
