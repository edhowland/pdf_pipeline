# text_parse.rb - class TextParse

class TextParse
  def initialize
    @keywords = ['ital']
  end
  def lexer string
  string.split(/[\[\]]/)
  end

  # chunks array into array of 2 element arrays : ['ab'] => [[:t, 'ab']]
  def chunker arr
    arr.map do |e|
      chunk = e.split(' ')
      if @keywords.member? chunk[0]
      [chunk[0].to_sym, chunk[1..(-1)].join(' ')]
      else
        [:t, e]
      end
    end
  end
end
