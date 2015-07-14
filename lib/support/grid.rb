# grid.rb -r method grid rows, cols

# grid r,c - creates an arrayof arrays with r inner arrays of c elements each
# each inner element is enumerated from 1 .. (rowxcol)
def enumerated_grid rows, cols
  (0..(rows-1)).to_a.map { |i| i * cols }.map do |i|
    ((i+1)..(i+cols)).to_a
  end
end


# grid rows, cols - empty array of arrays
def grid rows, cols, &blk
  output = [([nil] * cols)] * rows

  if block_given?
    output.map {|row| row.map {|col| yield } }
  else
    output
  end
end
