
require_relative 'transaction'
# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount

  MIN_DEPOSIT =  100

  attr_reader :name, :position, :transactions

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @position = 0
    @name, @iban = name, iban
    @transactions = []
    @allowed = true
    
    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    check_password
    if @allowed == true && @position > amount
      puts "Bitch ! you just withdrawed #{amount} euros ! Don't drink too much dude..."
      amount = -amount 
      add_transaction(amount)
    else
      puts "refused transaction"
    end
  end 
  
  def deposit(amount)
    check_password
    if @allowed == true
      puts "Nice ! you just made a #{amount} euros deposit ! Finally growing up..."
      add_transaction(amount)
    else
      puts "refused transaction"
    end
  end

  def check_password
    unless @allowed == false
      tries = 1
      puts "whats your password bro ?"
      pswd_try = gets.chomp
      until pswd_try == @password 
        puts "try again, and focus !"
        pswd_try = gets.chomp
        tries += 1
      break if tries > 10
          puts "The police is coming bro, you're fucked !"
          @allowed = false
          return
      end
    end
  end

  
 def transactions_history(args = {})
    # Should print transactions, BUT NOT return the transaction array !
    if args[:password] == @password
      @transactions.dup
    elsif args.empty?
      puts "no password given"
      return nil
    else 
      puts "Wrong ! You drunk ?"
    end
  end
  
  def iban
    return"#{@iban.to_s[0,4]}**************#{@iban[-3,3]}"
  end
   
  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    return "Owner: #{@name}\nYour IBAN is: #{iban}\nCurrent amount: #{@position}"
  end
          
  private  
  
  def add_transaction(amount)
    @position += amount
    @transactions <<Transaction.new(amount)
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 1000, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
puts account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
puts account.transactions_history(password: "brucewayne") # => wrong password
puts account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
# too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
