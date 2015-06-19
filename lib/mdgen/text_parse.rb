# text_parse.rb - class TextParse

class TextParse
  def lexer string
  string.split(/[\[\]]/)
  end

  def chunker arr
    arr.map do |e|
      if e.split(' ')[0] == 'ital'
      else
        [:t, e]
      end
    end
  end
end
