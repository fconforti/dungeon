class DamageDice < Dice

  def initialize(attack)
    @attack = attack
    @faces = (min_damage..max_damage).to_a
  end

  private
  def min_damage
    @min_damage ||= [0, @attack.attacker.strength - @attack.receiver.strength].max
  end

  def max_damage
    @max_damage ||= min_damage + rand(6)
  end

end