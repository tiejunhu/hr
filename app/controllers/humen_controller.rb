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
    dept_id = params[:dept_id] || "-1"
    offset = params[:iDisplayStart] || 0
    limit = params[:iDisplayLength] || -1
    filter_cond = Settings.filters[params[:filter]] || {}

    begin
      dept = Dept.find(dept_id)
      dept_ids_cond = { :dept_id => (dept.leaves << dept).collect{ |d| d.id } }
    rescue
      dept_ids_cond = {}
    end
    
    all_cond = dept_ids_cond.merge(filter_cond)
    
    @total = Human.where(dept_ids_cond).count
    @display_count = Human.where(all_cond).count
    Human.where(all_cond).order(sort_directive).limit(limit).offset(offset)
  end
  
  def sort_directive
    return "id" if params[:iSortingCols].to_i <= 0
    sort_col = params["mDataProp_#{params[:iSortCol_0]}"]
    sort_col = "dept_id" if sort_col == "dept_name"
    sort_dir = params[:sSortDir_0]
    "#{sort_col} #{sort_dir}"
  end
  
  def manager_icon(h)
    h.manager? ? " <i class=\"icon-eye-open\"></i>" : ""
  end
  
  def format_humen(humen)
    {
      :sEcho => params[:sEcho],
      :iTotalRecords => @total,
      :iTotalDisplayRecords => @display_count,
      :aaData => humen.collect{ |h| {
        :id => h.id,
        :name => "<a href=\"#{human_path(h)}\">#{h.name}</a>#{manager_icon(h)}",
        :login => h.login,
        :gender => h.gender,
        :marriage_state => h.marriage_state,
        :dept_name => ((h.dept == nil) ? "" : h.dept.name),
        :board_date => h.board_date,
        :employment_state => h.employment_state
      }}
    }
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
    # save this param and delete from hash, or there will be error
    is_manager = params[:human][:manager] == "1"
    params[:human].delete(:manager)

    @human = Human.new(params[:human])

    respond_to do |format|
      if @human.save
        @human.set_manager if is_manager
        @human.log_creation
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

    # set manager and delete this param from hash, or there will be error
    @human.set_manager if params[:human][:manager] == "1"
    params[:human].delete(:manager)

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
