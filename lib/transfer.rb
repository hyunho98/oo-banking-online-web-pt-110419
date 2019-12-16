class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance >= @amount && @sender.valid? == true
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'
    else
      return "Transaction rejected. Please check your account balance."
    end
  end

end
