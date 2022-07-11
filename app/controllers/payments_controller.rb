class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :update, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.where(category_id: @category.id).order(created_at: :desc)
    @total_amount = @items.sum(:amount)
  end

  def create
    @payments = current_user.payments.new(payment_params)

    if @payments.save
      redirect_to category_payments_path, notice: 'Payment was successfully created.'
    else
      render :new, notice: 'Transaction failed'
    end
  end

  def destroy
    @payment.destroy
    redirect_to category_payments_path, notice: 'Transaction successfully removed.'
  end

  private

  def set_payment
    @payment = current_user.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
