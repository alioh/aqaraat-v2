class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update]  # instead of repeating the same code in each method, we create one method that do the same thing, 
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @residents = current_user.residents
  end

  def show
  end

  def new
    @residents = current_user.residents.build
  end

  def create
    @residents = current_user.residents.build(resident_params)
    if @residents.save
      redirect_to @residents, notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resident.update(resident_params)
      redirect_to @resident, notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def resident_params
    params.require(:resident).permit(:name, :email, :phone_number, :summary)
  end
end
