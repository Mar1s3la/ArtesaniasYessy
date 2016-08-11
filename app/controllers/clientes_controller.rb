class ClientesController < ApplicationController
  before_action :set_cliente, except: [:index]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  private
  def set_cliente
    @user= User.find(params[:id])
  end
end
