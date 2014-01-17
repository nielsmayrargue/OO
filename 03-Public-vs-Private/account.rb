# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount

  MIN_DEPOSIT =  100

  attr_reader :name, :position

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban
    
    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    puts "whats your password bro ?"
    pswd_try = gets.chomp
    tries = 1
    if pswd_try == @password
      amount = amount * (-1)
      add_transaction(amount)
      puts "Bitch ! you just withdrawed #{amount} euros ! Don't drink too much dude..."
    elsif pswd_try != @password && tries < 3
      puts "try again, and focus !"
      tries += 1
      pswd_try = gets.chomp
    else 
      puts "The police is coming bro, you're fucked !"
    end
  end
  
  def deposit(amount)
    puts "whats your password bro ?"
    pswd_try = gets.chomp
    tries = 1
    if pswd_try == @password
      amount = amount * (-1)
      add_transaction(amount)
      puts "Great Sir ! You made a #{amount} euros deposit ! Looks like you finally grow up..."
    elsif pswd_try != @password && tries < 3
      puts "try again, and focus !"
      tries += 1
      pswd_try = gets.chomp
    else 
      puts "The police is coming bro, you're fucked !"
    end
  end
  
  
  def transactions_history(args = {})
    # Should print transactions, BUT NOT return the transaction array !
    if args[:password] == @password
      puts @transactions.to_s
    elsif args.empty?
      "no password given"
    else
      "wrong password"
    end
  end
  
  def iban
    puts "whats your password bro ?"
    pswd_try = gets.chomp
    puts "your IBAN is #{@iban.to_s[0,4]}**************#{@iban.to_s[-1,-5]}" if pswd_try == @password
  end
    
  
  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    puts "Owner: #{@name}"
    puts "IBAN: #{iban}"
    puts "Current amount: #{@position}"
  end
          
  private  
  
  def add_transaction(amount)
    # Main account logic
    # Should add the amount in the transactions array
    @transactions << amount
    # Should update the current position
    @position += amount
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

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
account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
# too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
