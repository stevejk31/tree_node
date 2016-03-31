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
    # first detach from parent
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
    

  end

  def bfs
  end

end
