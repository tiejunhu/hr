class DeptsController < ApplicationController
  before_filter :require_human

  # GET /depts
  # GET /depts.js
  # GET /depts.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: convert_to_tree_nodes(Dept.roots, nil) }
      format.js # index.js.erb
    end
  end

  def new_tree_node(title, key, isFolder)
    {
      :title => title,
      :key => key,
      :isFolder => isFolder,
      :children => []
    }
  end

  def convert_to_tree_nodes(depts, parent)
    parent = new_tree_node(Settings.dept_root_name, -1, true) if not parent
    depts.each do |d|
      node = new_tree_node(d.name, d.id, false)
      convert_to_tree_nodes(d.children, node) unless d.leaf?
      parent[:children].push(node)
      parent[:isFolder] = (parent[:children].size > 0)
    end
    parent
  end

  # GET /depts/1
  def show
    # @dept = Dept.find(params[:id])
  end

  # GET /depts/close
  def close
  end

  # GET /depts/new
  def new
    @dept = Dept.new
    @dept.parent_id = params[:parent_id]
  end

  # GET /depts/1/edit
  def edit
    @dept = Dept.find(params[:id])
  end

  # POST /depts
  def create
    @dept = Dept.new(params[:dept])
    
    respond_to do |format|
      if @dept.save
        format.html { render action: "close" }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /depts/1
  def update
    @dept = Dept.find(params[:id])

    respond_to do |format|
      if @dept.update_attributes(params[:dept])
        format.html { render action: "close" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /depts/1.js
  def destroy
    @dept = Dept.find(params[:id])
    @dept.destroy

    respond_to do |format|
      format.js 
    end
  end
    
end
