class Admin::HomesController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :correct_user, only: [:edit, :update]

  def top
    @orders = Order.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

end
