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
        logger.hit "#{attacker.name} inflicts a damage of #{damage} hp to #{receiver.name}"
      else
        logger.miss "#{attacker.name} doesn't inflict any damage to #{receiver.name}"
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

    def logger
      TTY::Logger.new do |config|
        config.types = {
          hit: {level: :info},
          miss: {level: :info}
        }
        config.handlers = [
          [:console, 
            styles: 
              {
                hit: {
                  symbol: "✓ ",
                  label: "HIT ",
                  color: :green,
                  levelpad: 0
                },
                miss: {
                  symbol: "✗ ",
                  label: "MISS",
                  color: :red,
                  levelpad: 0
                }
              }
          ]
        ]
      end
    end

  end
end
