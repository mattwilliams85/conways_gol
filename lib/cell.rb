class Cell
  attr_accessor :alive, :used

  def initialize
    @alive = false
    @used = false
  end

  def kill
    @alive = false
  end

  def birth
    @alive = true
  end

  def mark
    @used = true
  end
end
