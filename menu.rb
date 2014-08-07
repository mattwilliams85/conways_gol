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
  puts "C > Custom Game"
  puts "X > Exit"
  puts "\n"
  main_choice = gets.chomp.upcase
  if main_choice == "N"
    start_new
  elsif main_choice == "C"
    start_custom
  elsif main_choice == "X"
    exit
  else
    system 'clear'
    puts "Invalid! Try again"
    sleep(0.5)
    main_menu
  end
end

def start_new
  @new_world = World.new(99,5)
  @speed = 90
  @new_world.define_size
  @new_world.populate
  @new_world.seed
  play
end

def start_custom
  system "clear"
  puts "Please enter game size (1-99)"
  size = gets.chomp.to_i/2 + 50
  if size > 99
    puts "Too large!"
    sleep(0.1)
    start_custom
  elsif size < 50
    puts "Too small!"
    sleep(0.1)
    start_custom
  else
    puts "Please enter percent of populated cells (1-99)"
    percent = gets.chomp.to_i
    puts "Please enter growth speed (1-99)"
    @speed = gets.chomp.to_f
    if percent.to_i == 00 || @speed.to_i == 0
      puts "Invalid variables - press enter to try again!"
      sleep(0.5)
      start_custom
    else
      @new_world = World.new(size,percent)
      @new_world.define_size
      @new_world.populate
      @new_world.seed
      play
    end
  end
end

def play
  n = 0
  i = 0
  1000.times do
    system 'clear'
    @new_world.proliferate
    display(@new_world.grid)
    if n == @new_world.count && i < 10
      puts "\n"
      puts "Oh no! Life failed to bloom... Press enter to try again!"
      gets.chomp
      main_menu
    else
      n = @new_world.count
    end
    puts ""
    puts "Press Control + C to exit"
    sleep((100 - @speed)/10)
    i += 1
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
