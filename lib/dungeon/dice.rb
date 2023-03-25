class Dice

  attr_accessor :faces

  def initialize
    @faces = []
  end

  def roll
    faces.sample
  end

end