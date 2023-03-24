module Dungeon
  class Character

    attr_accessor :hp, :xp, :gold

    def initialize(hp: 100, xp: 0, gold: 10)
      @hp = hp
      @xp = xp
      @gold = gold
    end

    def attack(character)
      character.hp -= rand(10)
    end

    def alive?
      @hp > 0
    end

    def dead?
      !alive?
    end

  end
end