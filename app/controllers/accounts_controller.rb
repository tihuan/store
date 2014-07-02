class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = "Account successfully created."
      redirect_to @account
    else
      flash[:alert] = "Failed to create account. Please try again."
      render :new
    end
  end

private

  def account_params
    params.require(:account).permit!
  end

end
