class HumenController < ApplicationController
  before_filter :require_human
  
  # GET /humen
  # GET /humen.js
  # GET /humen.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: format_humen(find_humen) }
      format.js # index.js.erb
    end
  end
  
  def find_humen
    dept_id = params[:dept_id]
    if not dept_id or dept_id == -1.to_s
      return Human.order(get_sort_directive)
    else
      dept = Dept.find(dept_id)
      sub_depts = dept.leaves << dept
      return Human.where(:dept_id => sub_depts.collect{ |d| d.id } ).order(get_sort_directive)
    end
  end
  
  def get_sort_directive
    return "id" if params[:iSortingCols].to_i <= 0
    sort_col = params["mDataProp_#{params[:iSortCol_0]}"]
    sort_col = "dept_id" if sort_col == "dept_name"
    sort_dir = params[:sSortDir_0]
    return "#{sort_col} #{sort_dir}"
  end
  
  def format_humen(humen)
    data = JqueryDatatableData.new
    data.sEcho = params[:sEcho]
    data.iTotalRecords = humen.size
    data.iTotalDisplayRecords = humen.size
    humen.each do |h|
      data.aaData.push({
        :id => h.id, 
        :name => "<a href=\"#{human_path(h)}\">#{h.name}</a>", 
        :login => h.login, 
        :gender => h.gender, 
        :marriage_state => h.marriage_state, 
        :dept_name => ((h.dept == nil) ? "" : h.dept.name), 
        :board_date => h.board_date,
        :employment_state => h.employment_state
        })
    end
    data
  end

  # GET /humen/1
  # GET /humen/1.js
  def show
    respond_to do |format|
      format.html { @human = Human.find(params[:id]) }
      format.js { @human_id = params[:id] }
      format.css
    end
  end

  # GET /humen/close
  def close
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
        format.html { render action: "close" }
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
        format.html { render action: "close" }
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
