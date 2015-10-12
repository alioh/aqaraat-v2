class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update]      # instead of repeating the same code in each method, we create one method that do the same thing, 
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @bills = current_user.bills

  end

  def show
    @bill = Bill.find(params[:id])
    @photos = @bill.photos
    @title = "عرض فاتوره"

  end

  def new
    @bill = current_user.bills.build
    @title = "إنشاء فاتوره"
  end

  def create
    @bill = current_user.bills.build(bill_params)
    if @bill.save
      if params[:images]
        params[:images].each do |image|
          @bill.photos.create(image: image)
        end
      end

      @photos = @bill.photos
      redirect_to edit_bill_path(@bill), notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
    @title = "تعديل فاتوره"
    if current_user.id == @bill.user.id
      @photos = @bill.photos
    else
      redirect_to root_path, notice: "ليس لديك صلاحيات تعديل هذه الصفحه"
    end
  end

  def update
    if @bill.update(bill_params)
      if params[:images]
        params[:images].each do |image|
          @bill.photos.create(image: image)
        end
      end

      redirect_to edit_bill_path(@bill), notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:due_date, :amount, :bill_type, :bill_status, :description, :property_id, :resident_id)
  end
end