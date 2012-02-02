# encoding: utf-8

module DeptsHelper
  def all_depts
    depts = [["All Depts", -1]]
    level = 1
    Dept.roots.each do |d|
      sub_depts(depts, d, level)
    end
    return depts
  end
  
  def sub_depts(depts, dept, level)
    txt = "  " * level + dept.name
    depts << [txt, dept.id]
    level = level + 1
    if not dept.leaf?
      dept.children.each do |d|
        sub_depts(depts, d, level)
      end
    end
  end
end
