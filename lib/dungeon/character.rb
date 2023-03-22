module Dungeon
  class Character

    attr_accessor :hp

    def initialize(hp: 100)
      @hp = hp
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