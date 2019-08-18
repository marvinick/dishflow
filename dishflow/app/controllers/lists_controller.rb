class ListsController < ApplicationController
  before_action :set_menu
  before_action :set_list, only: [:show, :edit, :update, :destroy, :move]

  def index
    @lists = @menu.lists.sorted
  end

  def show
  end

  def new
    @list = @menu.lists.build
  end

  def edit; end

  def create
    @list = @menu.lists.new(list_params)
    respond_to do |format|
      if @list.save

        # ActionCable.server.broadcast "board", { commit: 'addList', payload: render_to_string(:show, format: :json) }

        format.html { redirect_to menu_lists_path(@menu, @lists), notice: "You have a created a new list!" }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def move
    @list.insert_at(list_params[:position].to_i)
    render action: :show
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to menu_lists_path(@menu, @lists), notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    redirect_to menu_path(@menu), notice: 'List was successfully destroyed.'
    # respond_to do |format|
    #   format.html { redirect_to menu_path(@menu), notice: 'List was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private

  def set_list
    @list = @menu.lists.find(params[:id])
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def list_params
    params.require(:list).permit(:id, :name, :body, :position, :description, :menu_id, foods_attributes: [:id, :name, :position, :_destroy])
  end
end
