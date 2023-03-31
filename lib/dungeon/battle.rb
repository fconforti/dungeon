module Dungeon
  class Battle

    ATTACK="Attack"
    RUNAWAY="Run away"
    ACTIONS = [ATTACK, RUNAWAY].freeze

    attr_accessor :attacker, :receiver

    def initialize(attacker, receiver)
      @attacker = attacker
      @receiver = receiver
    end

    def resolve
      logger.info "#{attacker.name} engages a battle with #{receiver.name}"
      loop do
        puts
        logger.info "#{@attacker.name} has #{@attacker.hp} hp. #{@receiver.name} has #{@receiver.hp} hp."
        case prompt.select("#{attacker.name}, choose your next action:", ACTIONS)
        when ATTACK
          logger.info "#{attacker.name} attacks #{receiver.name}"
          attacker.attack(receiver)
          if @receiver.alive?
            logger.info "#{receiver.name} attacks #{attacker.name}"
            receiver.attack(attacker) 
          end
          if resolved?
            puts
            logger.info "#{winner.name} wins the battle with #{looser.name}!"
            reward_winner
            break
          end
        when RUNAWAY
          logger.info "#{attacker.name} runs away"
          break
        end
      end
    end

    def resolved?
      attacker.dead? || receiver.dead?
    end

    def winner
      return unless resolved?
      receiver.dead? ? attacker : receiver
    end

    def looser
      return unless resolved?
      receiver.dead? ? receiver : attacker
    end

    private
    def reward_winner
      transfer_gold
      add_experience
    end

    def transfer_gold
      logger.info "#{winner.name} gets rewarded with #{looser.gold} gold."
      winner.gold += looser.gold
      looser.gold = 0
    end

    def add_experience
      logger.info "#{winner.name} gets 10 xp."
      winner.xp += 10
    end

    def prompt
      TTY::Prompt.new
    end

    def logger
      TTY::Logger.new do |config|
        config.handlers = [
          [:console, 
            styles: 
              {
                info: {
                  symbol: "⌗ ",
                  label: "INFO",
                  color: :blue,
                  levelpad: 0
                }
              }
          ]
        ]
      end
    end    
  end
end