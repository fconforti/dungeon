module Dungeon
  class Battle

    attr_accessor :attacker, :receiver

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
    end

    def fight
      loop do
        @receiver.hp -= rand(10)
        if @receiver.hp > 0
          @attacker.hp -= rand(10)
        end
        puts "receiver: #{receiver.hp}"
        puts "attacker: #{attacker.hp}"
        puts 
        break if @attacker.hp < 0 || @receiver.hp < 0
      end
    end

  end
end