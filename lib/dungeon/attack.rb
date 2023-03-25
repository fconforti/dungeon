module Dungeon
  class Attack

    attr_accessor :attacker, :receiver, :hit, :damage

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
      @hit = false
      @damage = 0
    end

    def resolve
      if resolve_hit
        resolve_damage
        apply_damage
      end
    end

    private
    def resolve_hit
      @hit = HitDice.new(self).roll
    end

    def resolve_damage
      @damage = DamageDice.new(self).roll
    end

    def apply_damage
      receiver.hp -= damage
    end
  end
end
