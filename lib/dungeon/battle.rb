module Dungeon
  class Battle

    attr_accessor :attacker, :receiver

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
    end

    def fight
      loop do
        @attacker.attack(@receiver)
        @receiver.attack(@attacker) if @receiver.alive?
        puts "receiver: #{receiver.hp}"
        puts "attacker: #{attacker.hp}"
        puts 
        break if @attacker.dead? || @receiver.dead?
      end
    end

  end
end