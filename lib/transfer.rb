class Transfer
  
attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
  end

  def execute_transaction
    if valid? && @status == "pending" && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"

    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
     if valid? && @status == "complete" && receiver.balance > @amount
        sender.balance += @amount
        receiver.balance -= @amount
        @status = "reversed"
     else
      @status = "rejected"
     end
    
    end

   
  end

end
