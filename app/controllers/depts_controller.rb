class DeptsController < ApplicationController
  # GET /depts
  # GET /depts.json
  def index
    @dept = Dept.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: convert_to_jstreenodes(Dept.roots, nil) }
      format.js { }
    end
  end

  # GET /depts/1
  def show
    @dept = Dept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /depts/new
  def new
    @dept = Dept.new
    @dept.parent_id = params[:parent_id]

    respond_to do |format|
      format.html # new.html.erb
    end
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
        format.html { redirect_to @dept }
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
        format.html { redirect_to @dept }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /depts/1
  # DELETE /depts/1.json
  def destroy
    @dept = Dept.find(params[:id])
    @dept.destroy

    respond_to do |format|
      format.html { redirect_to depts_url }
      format.json { head :ok }
      format.js 
    end
  end
  
  def convert_to_jstreenodes(depts, parent)
    parent = JsTreeNode.new if not parent
    depts.each do |d|
      node = JsTreeNode.new
      node.title = d.name
      node.key = d.id
      convert_to_jstreenodes(d.children, node)
      node.isFolder = (node.children.size > 0)
      parent.children << node
    end
    parent
  end
  
end
