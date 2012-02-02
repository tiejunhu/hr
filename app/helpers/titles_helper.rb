module TitlesHelper
  def all_bands
    Level.all.collect {|t| t.band}.uniq.sort
  end
end
