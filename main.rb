require './lib/screen'
require './lib/hanoi'

hanoi = Hanoi.new

screen = Screen.new(hanoi.rods)

while not(hanoi.finished?)
  c = gets.gsub!(/\n/,'')
  case c
  when /([abc]) -> ([abc])/
    begin
      from = $1.to_sym
      to = $2.to_sym
      hanoi.move(from, to)
      p hanoi.rods
    rescue Exception => e
      puts "Invalid operation"
    end
    screen.render(hanoi.rods)
  when 'q', 'x', '!'
    puts 'Bye!'
    exit
  else
    puts "Invalid command: '#{c}'"
  end
end
