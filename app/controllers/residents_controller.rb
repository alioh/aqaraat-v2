class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update]  # instead of repeating the same code in each method, we create one method that do the same thing, 
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @residents = current_user.residents.page(params[:page]).per(10)   # page(params[:page]).per(10) this is the pagination part

  end

  def show
    @resident = Resident.find(params[:id])
    @photos = @resident.photos
    @title = "عرض العميل"

  end

  def new
    @resident = current_user.residents.build
  end

  def create
    @resident = current_user.residents.build(resident_params)
    if @resident.save
      if params[:images]
        params[:images].each do |image|
          @resident.photos.create(image: image)
        end
      end

      @photos = @resident.photos
      redirect_to edit_resident_path(@resident), notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
    @title = "تعديل العميل"
    if current_user.id == @resident.user.id
      @photos = @resident.photos
    else
      redirect_to root_path, notice: "ليس لديك صلاحيات تعديل هذه الصفحه"
    end
  end

  def update
    if @resident.update(resident_params)
      if params[:images]
        params[:images].each do |image|
          @resident.photos.create(image: image)
        end
      end

      redirect_to edit_resident_path(@resident), notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:name, :email, :phone_number, :summary, :property_id)
  end
end
