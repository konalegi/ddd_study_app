class Profile::Car
  attr_reader :mark, :model

  def initialize(mark, model)
    @mark = mark
    @model = model
  end
end