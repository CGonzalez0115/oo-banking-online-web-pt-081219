class Transfer
  attr_accessor :sender, :amount, :status, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount && @status != "complete"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
   if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
