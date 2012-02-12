class OrgChartsController < ApplicationController
  # GET /org_charts
  # GET /org_charts.json
  # GET /org_charts.js
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: json_data }
      format.js
    end
  end

  def new_node(id, name)
    {
      # :id => id,
      :name => name,
      :children => []
    }
  end
  
  def add_dept_children(node, depts)
    depts.each do |d|
      n = new_node(d.id, d.name)
      if d.leaf?
        add_human_children(n, d)
      else
        add_dept_children(n, d.children)
      end
      n[:manager] = d.manager ? d.manager.name : ""
      n[:count] = d.all_managing_humen.count
      node[:children].push(n)
    end
  end
  
  def add_human_children(node, dept)
    children = node[:children]
    dept.directly_managing_humen.each do |h|
      next if h.manager?
      n = { :name => h.name }
      children.push(n)
    end
  end
  
  def json_data
    id = params[:id] || "-1"
    begin
      chart = OrgChart.find(id)
      JSON(chart.json)
    rescue
      root = new_node(-1, Settings.dept_root_name)
      add_dept_children(root, Dept.roots)
      root
    end
  end

  # GET /org_charts/close
  def close
  end

  # GET /org_charts/new
  def new
    @org_chart = OrgChart.new
    @org_chart.effective_date = Date.current
  end

  # POST /org_charts
  def create
    @org_chart = OrgChart.new(params[:org_chart])
    @org_chart.json = json_data.to_json.to_str

    respond_to do |format|
      if @org_chart.save
        format.html { render action: "close" }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  # GET /org_charts/1/edit
  def edit
    @org_chart = OrgChart.find(params[:id])
  end
  
  # PUT /org_charts/1
  def update
    @org_chart = OrgChart.find(params[:id])

    respond_to do |format|
      if @org_chart.update_attributes(params[:org_chart])
        format.html { render action: "close" }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  # DELETE /org_charts/1.js
  def destroy
    @org_chart = OrgChart.find(params[:id])
    @org_chart.destroy

    respond_to do |format|
      format.js
    end
  end

end
