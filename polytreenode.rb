class TreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children()
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    return nil if parent == self.parent

    if self.parent != parent
      self.parent.children.delete(self)
    end

    @parent = parent
    self.parent.children << self unless self.parent.nil?

    self
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if child && !self.children.include?(child)
      raise "not a child"
    end

    child.parent = nil
  end


  def dfs (target, &prc)
    prc = Proc.new {|node| node.value == target}
    return self if prc.call(self)
    children.each do |child|
      result = child.dfs(target, &prc)
      return result if !!result
    end
    nil
  end

  def bfs(target, &)

  end

end
