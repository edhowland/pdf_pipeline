
# text_parse.rb - class TextParse

class TextParse
  def lexer string
  string.split(/[\[\]]/)
  end

  # chunks array into array of 2 element arrays : ['ab'] => [[:t, 'ab']]
  def chunker arr
    arr.map do |e|
      chunk = e.split(' ')
      if chunk[0] == 'ital'
      [:ital, chunk[1..(-1)].join(' ')]
      else
        [:t, e]
      end
    end
  end
end
