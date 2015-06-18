# md_kit.rb - MdKit a renderrer to Markdown

class MdKit

  def h1 text
  puts "# #{text}"
  end

  def h2 text
    puts "## #{text}"
  end

  def code text
    puts '```'
    puts text
    puts '```'
  end

  def ol list
    list.each_with_index do |e, i|
      puts "#{i+1}. #{e}"
    end
  end


  def ul list
    list.each do |e|
      puts "+#{e}"
    end
  end

  def text string
    puts string
  end
  def render codes
    codes.each do |e|
      self.send e[0], e[1]
      puts
    end
  end
end
