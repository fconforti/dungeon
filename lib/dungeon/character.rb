require "yaml"

module Dungeon
  class Character

    attr_accessor :type, :hp, :strength, :speed, :xp, :gold

    def initialize(type: "warrior", xp: 0, gold: 0)
      @type = type
      @hp = base_stats["hp"][0]
      @strength = base_stats["strength"][0]
      @speed = base_stats["speed"][0]
      @xp = xp
      @gold = gold
    end

    def attack(character)
      Attack.new(self, character).resolve
    end

    def alive?
      @hp > 0
    end

    def dead?
      !alive?
    end

    def base_stats
      @yaml ||= YAML.load_file("config/characters.yml")
      @yaml[@type]
    end

  end
end