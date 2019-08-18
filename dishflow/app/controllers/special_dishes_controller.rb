class SpecialDishesController < ApplicationController
  before_action :set_special_dish, only: [:show, :edit, :update, :destroy]

  # GET /special_dishes
  # GET /special_dishes.json
  def index
    @special_dishes = SpecialDish.all
  end

  # GET /special_dishes/1
  # GET /special_dishes/1.json
  def show
  end

  # GET /special_dishes/new
  def new
    @special_dish = SpecialDish.new
  end

  # GET /special_dishes/1/edit
  def edit
  end

  # POST /special_dishes
  # POST /special_dishes.json
  def create
    @special_dish = SpecialDish.new(special_dish_params)

    respond_to do |format|
      if @special_dish.save
        format.html { redirect_to @special_dish, notice: 'Special dish was successfully created.' }
        format.json { render :show, status: :created, location: @special_dish }
      else
        format.html { render :new }
        format.json { render json: @special_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_dishes/1
  # PATCH/PUT /special_dishes/1.json
  def update
    respond_to do |format|
      if @special_dish.update(special_dish_params)
        format.html { redirect_to @special_dish, notice: 'Special dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_dish }
      else
        format.html { render :edit }
        format.json { render json: @special_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_dishes/1
  # DELETE /special_dishes/1.json
  def destroy
    @special_dish.destroy
    respond_to do |format|
      format.html { redirect_to special_dishes_url, notice: 'Special dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_dish
      @special_dish = SpecialDish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_dish_params
      params.require(:special_dish).permit(:name, :description, :price)
    end
end
