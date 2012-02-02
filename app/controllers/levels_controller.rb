class LevelsController < ApplicationController

  # GET /levels/1
  def show
    # @level = Level.find(params[:id])
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.json
  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1.js
  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.js
    end
  end
end
