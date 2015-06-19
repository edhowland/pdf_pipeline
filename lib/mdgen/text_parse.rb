# text_parse.rb - class TextParse

class TextParse
  def lexer string
  string.split(/[\[\]]/)
  end

  def chuncker arr
    []
  end
end
