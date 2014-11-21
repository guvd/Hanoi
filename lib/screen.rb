class Screen

  def initialize (roads)
    render(roads)
  end
  def render_rod(rod)
    out = []
    2.downto(0).each do |i|
      row = []
      if (pixel = rod[i])
         rod[i].times { row.push("_") }
         (3-rod[i]).times { row.push(" ") }
      else
         3.times { row.push(" ") }
      end
      out << row.reverse + ["|"] + row
    end
    out.each do |row|
      puts row.join
    end
    out
    puts "\n"
  end

  def render(roads)
    puts "   a"
    render_rod(roads[:a])
    puts "   b"
    render_rod(roads[:b])
    puts "   c"
    render_rod(roads[:c])
  end

end
