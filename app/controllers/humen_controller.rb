class HumenController < ApplicationController
  before_filter :require_human
  
  # GET /humen
  # GET /humen.js
  # GET /humen.json
  def index
    dept_id = params[:dept_id]
    if not dept_id or dept_id == -1.to_s
      @humen = Human.all
    else
      dept = Dept.find(dept_id)
      sub_depts = dept.leaves << dept
      @humen = Human.where(:dept_id => sub_depts.collect{ |d| d.id } )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: convert_to_table_json(@humen) }
      format.js # index.js.erb
    end
  end
  
  def convert_to_table_json(humen)
    data = JqueryDatatableData.new
    data.sEcho = params[:sEcho]
    data.iTotalRecords = humen.size
    data.iTotalDisplayRecords = humen.size
    humen.each do |h|
      data.aaData << [h.id, h.name, ((h.dept == nil) ? "" : h.dept.name), h.board_date]
    end
    data
  end

  # GET /humen/1
  def show
    # @human = Human.find(params[:id])
  end

  # GET /humen/new
  def new
    @human = Human.new
    @human.dept_id = params[:dept_id]
  end

  # GET /humen/1/edit
  def edit
    @human = Human.find(params[:id])
  end

  # POST /humen
  def create
    @human = Human.new(params[:human])

    respond_to do |format|
      if @human.save
        format.html { redirect_to @human, notice: 'Human was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /humen/1
  def update
    @human = Human.find(params[:id])
    @human.updating_password = params[:human][:password].length > 0

    respond_to do |format|
      if @human.update_attributes(params[:human])
        format.html { redirect_to @human, notice: 'Human was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /humen/1.js
  def destroy
    @human = Human.find(params[:id])
    @human.destroy

    respond_to do |format|
      format.js { }
    end
  end
    
end
