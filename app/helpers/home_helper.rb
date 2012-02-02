module HomeHelper
  def current_human_name
    current_human ? current_human.name : ""
  end
end
