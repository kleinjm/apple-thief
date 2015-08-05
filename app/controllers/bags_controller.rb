class BagsController < ApplicationController
  # GET /bags
  # GET /bags.json
  def index
    @bag_arrays = Bag.all.each_slice(3).to_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bags }
    end
  end

  # GET /bags/new
  # GET /bags/new.json
  def new
    @bag = Bag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bag }
    end
  end

  # GET /bags/1/edit
  def edit
    @bag = Bag.find(params[:id])
  end

  # POST /bags
  # POST /bags.json
  def create
    @bag = Bag.new(params[:bag])

    respond_to do |format|
      if @bag.save
        format.html { redirect_to bags_path, notice: 'Bag was successfully created.' }
        format.json { render json: @bag, status: :created, location: @bag }
      else
        format.html { render action: "new" }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bags/1
  # PUT /bags/1.json
  def update
    @bag = Bag.find(params[:id])

    respond_to do |format|
      if @bag.update_attributes(params[:bag])
        format.html { redirect_to bags_path, notice: 'Bag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bags/1
  # DELETE /bags/1.json
  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy

    respond_to do |format|
      format.html { redirect_to bags_url }
      format.json { head :no_content }
    end
  end
end
