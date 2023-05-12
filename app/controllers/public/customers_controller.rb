class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
  end

  def confirm
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email, :last_name_kana, :first_name_kana, :postal_code, :address,
                                     :telephone_number)
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to(customer_path(current_customer)) unless @customer == current_customer
  end

end
