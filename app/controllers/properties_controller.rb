class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]  # instead of repeating the same code in each method, we create one method that do the same thing, 
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @properties = current_user.properties
  end

  def show
  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :city, :country, :property_type, :monthly_rent, :description, :vacancy)
  end
end
