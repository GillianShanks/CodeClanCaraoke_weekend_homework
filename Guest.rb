class Guest

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def pays(fee)
    return @wallet -= fee
  end
end
