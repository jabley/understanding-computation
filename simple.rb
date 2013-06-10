class Number < Struct.new(:value)
end

class Add < Struct.new(:addend, :augend)
end

class Multiply < Struct.new(:left, :right)
end
