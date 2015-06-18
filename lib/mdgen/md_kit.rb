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


  def text string
    puts string
  end
  def render codes

  end
end
