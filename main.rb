require 'bundler'
Bundler.require(:default)
require_relative 'lib/dungeon'

include Dungeon

attacker = Character.new(hp: 100)
receiver = Character.new(hp: 100)

battle = Battle.new(attacker, receiver)
battle.fight