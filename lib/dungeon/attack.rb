module Dungeon
  class Attack

    attr_accessor :attacker, :receiver

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
    end

    def resolve
      return if miss?
      receiver.hp -= damage
    end

    def strength
      attacker.strength - receiver.strength
    end

    def miss?
      false
    end

    def damage
      @damage ||= base_damage + strength
    end

    private
    def base_damage
      rand(10)
    end
  end
end
