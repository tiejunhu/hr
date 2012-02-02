class BandsController < ApplicationController
  def index
    respond_to do |format|
      format.html { calc_bands } # index.html.erb
      format.js # index.js.erb
    end
  end
  
  def calc_bands
    @bands = {}
    levels = Level.all
    bands = levels.collect {|t| t.band}.uniq.sort
    bands.each do |b|
      titles = Title.where(["band = ?", b])
      levels = Level.where(["band = ?", b])
      @bands[b] = {:t => titles, :l => levels}
    end
  end
  
end
