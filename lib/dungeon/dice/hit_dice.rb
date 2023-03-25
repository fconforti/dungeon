class HitDice < Dice

  def initialize(attack)
    @attack = attack
    @faces = true_faces + false_faces
  end

  private
  def true_faces
    [true] * (@attack.attacker.speed + rand(6))
  end

  def false_faces
    [false] * @attack.receiver.speed
  end

end