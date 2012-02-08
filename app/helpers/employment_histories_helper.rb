module EmploymentHistoriesHelper
  def all_levels
    Level.order("level").collect { |l| ["#{l.level} (#{l.salary_from} - #{l.salary_to})", l.id] }
  end

  def all_titles
    Title.order("band").collect { |t| [t.title, t.id] }
  end
end
