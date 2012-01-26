require 'jstreenode'

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

  # POST /depts
  # POST /depts.json
  def create
    @dept = Dept.new(params[:dept])
    
    respond_to do |format|
      if @dept.save
        format.html { redirect_to :action => "index" }
        format.json { render json: @dept, status: :created, location: @dept }
        format.js { }
      else
        format.html { render action: "new" }
        format.json { render json: @dept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /depts/1
  # PUT /depts/1.json
  def update
    @dept = Dept.find(params[:id])

    respond_to do |format|
      if @dept.update_attributes(params[:dept])
        format.html { redirect_to :action => "index" }
        format.json { head :ok }
        format.js { }
      else
        format.html { render action: "edit" }
        format.json { render json: @dept.errors, status: :unprocessable_entity }
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
