class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @accounts = Account.paginate(page: params[:page], per_page: 5)
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      flash[:notice] = "Account was created successfully."
      redirect_to @account
    else
      render 'new'
    end
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "Account was edited successfully."
      redirect_to @account
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    flash[:notice] = "Account was deleted successfully."
    redirect_to accounts_path
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @account.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own accounts."
      redirect_to @account
    end
  end

end
