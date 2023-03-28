require 'bundler'
Bundler.require(:default)
require_relative 'lib/dungeon'

include Dungeon

attacker = Character.new(type: "warrior", gold: 10)
receiver = Character.new(type: "thief", gold: 20)

battle = Battle.new(attacker, receiver)
winner = battle.resolve
puts "Winner: #{winner.type} (hp: #{winner.hp}, xp: #{winner.xp}, gold: #{winner.gold})"
