class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]  # instead of repeating the same code in each method, we create one method that do the same thing,
                                                              # and instead of calling the same method in show/edit/update, we created an action that call that
                                                              # method automatically whenever we visit those pages or do those actions.
  before_action :authenticate_user!

  def index
    @properties = current_user.properties.page(params[:page]).per(10)

  end

  def show
    @property = Property.find(params[:id])
    # @hash = Gmaps4rails.build_markers @property do |u, m|
    #   m.lat u.geocode.first rescue nil
    #   m.lng u.geocode.second rescue nil
    #   m.json({ :id => u.id })
    @photos = @property.photos

  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      if params[:images]
        params[:images].each do |image|
          @property.photos.create(image: image)
        end
      end

      @photos = @property.photos
      redirect_to edit_property_path(@property), notice: "تم الحفظ"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @property.user.id
      @photos = @property.photos
    else
      redirect_to root_path, notice: "ليس لديك صلاحيات تعديل هذه الصفحه"
    end
  end

  def update
    if @property.update(property_params)
      if params[:images]
        params[:images].each do |image|
          @property.photos.create(image: image)
        end
      end

      redirect_to edit_property_path(@property), notice: "تم التحديث"
    else
      render :edit
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :city, :country, :property_type, :monthly_rent, :description, :vacancy, :lat, :lng)
  end
end
