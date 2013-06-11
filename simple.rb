class Number < Struct.new(:value)
  def reducible?
    false
  end

  def to_s
    value.to_s
  end

  def inspect
    "<#{self}>"
  end
end

class Add < Struct.new(:addend, :augend)
  def reduce
    if addend.reducible?
      Add.new(addend.reduce, augend)
    elsif augend.reducible?
      Add.new(addend, augend.reduce)
    else
      Number.new(addend.value + augend.value)
    end
  end

  def reducible?
    true
  end

  def to_s
    "#{addend} + #{augend}"
  end

  def inspect
    "<#{self}>"
  end
end

class Multiply < Struct.new(:left, :right)
  def reduce
    if left.reducible?
      Multiply.new(left.reduce, right)
    elsif right.reducible?
      Multiply.new(left, right.reduce)
    else
      Number.new(left.value * right.value)
    end
  end

  def reducible?
    true
  end

  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<#{self}>"
  end
end

class Machine < Struct.new(:expression)
  def step
    self.expression = expression.reduce
  end

  def run
    while expression.reducible?
      puts expression
      step
    end

    puts expression
  end
end
