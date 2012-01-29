class JsTreeNode
  attr_accessor :title, :children, :isFolder, :key
  
  def initialize
    @title = "All Depts"
    @isFolder = true
    @key = -1
    @children = []
  end
end