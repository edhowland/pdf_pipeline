# text_format.rb - class TextFormat

class TextFormat

  def format arr
    arr.map {|e| e[1] }.reduce('') {|i, j| i << j }
  end
end
