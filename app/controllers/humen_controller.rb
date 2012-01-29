class HumenController < ApplicationController
  # GET /humen
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
      line = []
      line << h.id
      line << h.name
      line << ((h.dept == nil) ? "" : h.dept.name)
      line << h.board_date
      data.aaData << line
    end
    data
  end

  # GET /humen/1
  # GET /humen/1.json
  def show
    @human = Human.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @human }
    end
  end

  # GET /humen/new
  # GET /humen/new.json
  def new
    @human = Human.new
    @human.dept_id = params[:dept_id]

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /humen/1/edit
  def edit
    @human = Human.find(params[:id])
  end

  # POST /humen
  # POST /humen.json
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
  # PUT /humen/1.json
  def update
    @human = Human.find(params[:id])

    respond_to do |format|
      if @human.update_attributes(params[:human])
        format.html { redirect_to @human, notice: 'Human was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @human.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /humen/1
  # DELETE /humen/1.json
  def destroy
    @human = Human.find(params[:id])
    @human.destroy

    respond_to do |format|
      format.html { redirect_to humen_url }
      format.json { head :ok }
      format.js { }
    end
  end
    
end
