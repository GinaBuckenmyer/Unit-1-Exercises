require_relative "player"
require_relative "game"
require_relative "clumsy_player"
require_relative "berserk_player"


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
klutz = ClumsyPlayer.new("klutz", 105)
berserker = BerserkPlayer.new("berserker", 50)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift||"players.csv")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(klutz)
knuckleheads.add_player(berserker)
knuckleheads.play(3)

knuckleheads.print_stats

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "please enter a number or 'quit'"
  end

  knuckleheads.save_high_scores
end
