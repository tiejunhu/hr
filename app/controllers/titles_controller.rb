class TitlesController < ApplicationController

  # GET /titles/1
  def show
    # @title = Title.find(params[:id])
  end

  # GET /titles/new
  # GET /titles/new.json
  def new
    @title = Title.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @title }
    end
  end

  # GET /titles/1/edit
  def edit
    @title = Title.find(params[:id])
  end

  # POST /titles
  def create
    @title = Title.new(params[:title])

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: 'Title was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /titles/1
  def update
    @title = Title.find(params[:id])

    respond_to do |format|
      if @title.update_attributes(params[:title])
        format.html { redirect_to @title, notice: 'Title was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /titles/1.js
  def destroy
    @title = Title.find(params[:id])
    @title.destroy

    respond_to do |format|
      format.js
    end
  end
end
