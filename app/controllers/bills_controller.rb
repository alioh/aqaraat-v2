class BillsController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]  # instead of repeating the same code in each method, we create one method that do the same thing, 
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @bills = current_user.bills
  end

  def show
  end

  def new
    @bill = current_user.bills.build
  end

  def create
    @bill = current_user.bills.build(bill_params)
    if @bill.save
      redirect_to @bill, notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bill.update(bill_params)
      redirect_to @bill, notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:due_date, :amount, :bill_type, :bill_status, :description)
  end
end