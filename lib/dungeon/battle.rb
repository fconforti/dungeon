module Dungeon
  class Battle

    ATTACK="A"
    RUNAWAY="R"
    ACTIONS = [ATTACK, RUNAWAY].freeze

    attr_accessor :attacker, :receiver

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
    end

    def resolve
      loop do
        case prompt.select("What's next?", ACTIONS)
        when ATTACK
          @attacker.attack(@receiver)
          @receiver.attack(@attacker) if @receiver.alive?
          break if resolved?
        when RUNAWAY
          break
        end
      end
      reward_winner
      winner
    end

    def resolved?
      @attacker.dead? || @receiver.dead?
    end

    def winner
      return unless resolved?
      @receiver.dead? ? @attacker : @receiver
    end

    def looser
      return unless resolved?
      @receiver.dead? ? @receiver : @attacker
    end

    private
    def reward_winner
      transfer_gold
      add_experience
    end

    def transfer_gold
      winner.gold += looser.gold
      looser.gold = 0
    end

    def add_experience
      winner.xp += 10
    end

    def prompt
      TTY::Prompt.new
    end
  end
end