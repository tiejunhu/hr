class EmploymentHistoriesController < ApplicationController

  # GET /employment_histories/index.json
  def index
    respond_to do |format|
      format.json { render json: format_histories }
    end
  end
  
  def format_histories
    histories = EmploymentHistory.where(:human_id => params[:human_id]).order("start_from desc")
    {
      :sEcho => params[:sEcho],
      :iTotalRecords => histories.size,
      :iTotalDisplayRecords => histories.size,
      :aaData => histories.collect{ |h| {
        :id => h.id, 
        :level => h.level.level, 
        :title => h.title.title, 
        :start_from => h.start_from, 
        :monthly_pay => h.monthly_pay, 
        :base_rate => h.base_rate,
        :pay_month_per_year => h.pay_month_per_year,
        :reason => h.reason
      }}
    }
  end

  def show
    # @employment_history = EmploymentHistory.find(params[:id])
  end
  
  # GET /employment_histories/close
  def close
  end
  
  def copy_attr(src, tgt, attrs)
    return unless src
    return unless tgt
    attrs.each do |a|
      tgt.send("#{a}=", src.send(a))
    end
  end

  def new
    @employment_history = EmploymentHistory.new
    human_id = params[:human_id]
    @human = Human.find(human_id)
    last_employ = EmploymentHistory.where(:human_id => human_id).order(:start_from).last
    copy_attr(last_employ, @employment_history, [:level_id, :title_id, :monthly_pay, :base_rate, :pay_month_per_year])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /employment_histories/1/edit
  def edit
    @employment_history = EmploymentHistory.find(params[:id])
    @human = @employment_history.human
  end

  # POST /employment_histories
  def create
    @employment_history = EmploymentHistory.new(params[:employment_history])

    respond_to do |format|
      if @employment_history.save
        format.html { render action: "close" }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /employment_histories/1
  def update
    @employment_history = EmploymentHistory.find(params[:id])

    respond_to do |format|
      if @employment_history.update_attributes(params[:employment_history])
        format.html { render action: "close" }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /employment_histories/1.js
  def destroy
    @employment_history = EmploymentHistory.find(params[:id])
    @employment_history.destroy

    respond_to do |format|
      format.js
    end
  end
end
