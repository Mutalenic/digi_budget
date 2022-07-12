class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :update, :destroy]

  def index
    @user = current_user
    @categories = current_user.categories.includes(:payments).order(created_at: :desc)
  end

  def create
    add_payment = current_user.payments.new(payment_params)

    if add_payment.save
      redirect_to payments_path, notice: 'Payment was successfully created.'
    else
      render :new, notice: 'Payment was not created.'
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to payments_path, notice: 'Payment was successfully updated.'
    else
      render :edit, notice: 'Payment was not updated.'
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_path, notice: 'Payment was successfully destroyed.'
  end

  private

  def set_payment
    @payment = current_user.payments.find(params[:id])
  end

  def payment_params
    params.permit(:name, :amount, :category_id)
  end

  def category_params
    params.permit(:name, :icon)
  end

end
