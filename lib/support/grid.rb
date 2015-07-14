# grid.rb -r method grid rows, cols

# grid r,c - creates an arrayof arrays with r inner arrays of c elements each

def grid rows, cols
  (0..(rows-1)).to_a.map { |i| i * cols }.map do |i|
    ((i+1)..(i+cols)).to_a
  end
end
