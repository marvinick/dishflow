class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :user_not_signed_in, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:new]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    if !user_signed_in?
      @account = Account.new
      @account.build_owner
    else
      redirect_to root_path, notice: "You're already signed in."
    end
  end

  def edit
  end

  def create
    account = Account.create(account_params)
    sign_in(account.owner)
    flash[:notice] = "Your account has been created."
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_not_signed_in


    end

    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, { owner_attributes: [:email, :password, :password_confirmation] } )
    end
end
