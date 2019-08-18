class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_food

  def index
    @reviews = @food.reviews.all
  end

  def show
  end

  def new
    # @review = @food.reviews.build
    @review = Review.new(menu_id: params[:menu_id], food_id: params[:food_id])
  end

  def edit
  end

  def create
    @review = @food.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@menu, @food, @review], notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:food_id, :menu_id, :public, :private, properties: {})
  end

  def set_food
    @menu = Menu.find(params[:menu_id])
    @food = Food.find(params[:food_id])
  end
end
