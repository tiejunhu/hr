class JqueryDatatableData
  
  attr_accessor :sEcho, :iTotalRecords, :iTotalDisplayRecords, :aaData
  
  def initialize
    @sEcho = 1
    @iTotalRecords = 0
    @iTotalDisplayRecords = 0
    @aaData = []
  end
end