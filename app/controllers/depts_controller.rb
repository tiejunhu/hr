class DeptsController < ApplicationController
  before_filter :require_human

  # GET /depts
  # GET /depts.js
  # GET /depts.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: convert_to_jstreenodes(Dept.roots, nil) }
      format.js # index.js.erb
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
