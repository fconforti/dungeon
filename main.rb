require 'bundler'
Bundler.require(:default)
require_relative 'lib/dungeon'

font = TTY::Font.new(:doom)
puts font.write("DUNGEON")

include Dungeon

attacker = Character.new(type: "daemon", gold: 10)
receiver = Character.new(type: "dragon", gold: 20)

battle = Battle.new(attacker, receiver)
winner = battle.resolve