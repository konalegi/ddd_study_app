class ProfileAggregate
  attr_reader :id

  def add_car(model, mark)
    cars << Profile::Car.new(model, mark)
  end

  def cars; @cars ||= []; end
end