require './lib/cell'
require './lib/rules'
require './lib/world'

def header
  system 'clear'
  puts "
▒█▀▀█ █▀▀█ █▀▄▀█ █▀▀ 　 █▀▀█ █▀▀ 　 ▒█░░░ ░▀░ █▀▀ █▀▀
▒█░▄▄ █▄▄█ █░▀░█ █▀▀ 　 █░░█ █▀▀ 　 ▒█░░░ ▀█▀ █▀▀ █▀▀
▒█▄▄█ ▀░░▀ ▀░░░▀ ▀▀▀ 　 ▀▀▀▀ ▀░░ 　 ▒█▄▄█ ▀▀▀ ▀░░ ▀▀▀
"
end

def main_menu
  header
  puts "\n"
  puts "N > New Game"
  puts "X > Exit"
  puts "\n"
  main_choice = gets.chomp.upcase
  if main_choice == "N"

    start_game
  elsif main_choice == "X"
    exit
  else
    system 'clear'
    puts "Invalid! Try again"
  end
end

def start_game
  system "clear"
  puts "Please enter game size (50-100)"
  size = gets.chomp.to_i
  if size > 100
    puts "Too large!"
    sleep(0.1)
    start_game
  elsif size < 50
    puts "Too small!"
    sleep(0.1)
    start_game
  else
    puts "Please enter percent of populated cells (1-99)"
    percent = gets.chomp.to_i
    puts "Please enter growth speed (1-100)"
    percent = gets.chomp.to_i
    @new_world = World.new(size,percent)
    @new_world.define_size
    @new_world.populate
    @new_world.seed
    play
  end
end

def play
  i = 0
  1000.times do
    system 'clear'
    @new_world.proliferate
    display(@new_world.grid)
    if i == @new_world.count
      puts "\n"
      puts "Oh no! Life failed to bloom... Press enter to try again!"
      gets.chomp
      start_game
    else
      i = @new_world.count
    end
    puts ""
    puts "Press Control + C to exit"
    sleep(1)
  end
end



def display(grid)
  grid.each do |row|
    puts ""
    row.each do |cell|
      if cell.alive
        print "█"
      elsif cell.used
        print "░"
      else
        print " "
      end
    end
  end
end

main_menu





