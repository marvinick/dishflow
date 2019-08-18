class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy, :move]
  before_action :set_menu

  def index
    @foods = @menu.foods.sorted
  end

  def show
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = @menu.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to menu_food_path(@menu, @food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy!
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move
    @food.update(food_params)
    render action: :show
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:menu_id, :name, :body, :description, :price, :position, :list_id)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end
