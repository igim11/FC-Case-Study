class Account
    attr_reader :user_ID

    def initialize(user_ID, initial_balance)
        @user_ID = user_ID
        @balance = initial_balance
    end

    def deposit(amount, display_message = true)
        if amount > 0
            @balance += amount
            puts("#{amount} successfully deposited!") if display_message
        else
            puts("Invalid deposit amount.") if display_message
        end
    end

    def withdraw(amount)
        if amount > 0 && @balance >= amount
            @balance -= amount
            puts("#{amount} successfully withdrawn!")
        else
            puts("Insufficient balance or invalid withdrawal amount.")
        end
    end

    def transfer(recipient, amount)
        if amount > 0 && @balance >= amount
            @balance -= amount
            recipient.deposit(amount, false)
            puts("#{amount} successfully transferred to #{recipient.user_ID}!")
        else
            puts("Insufficient balance or invalid amount.")
        end
    end

    def check_balance()
        puts(@balance)
    end
end

myAccount = Account.new("Account 1", 100)
myAccount.deposit(500)
myAccount.withdraw(100)
yourAccount = Account.new("Account 2", 0)

myAccount.transfer(yourAccount, 100)
myAccount.check_balance
yourAccount.check_balance