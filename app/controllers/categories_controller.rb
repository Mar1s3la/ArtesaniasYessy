class CategoriesController < ApplicationController
    before_action :set_category, except: [:index, :new, :create]
    before_action :authenticate!

    def new
    @category= Category.new
  end

  def create
    @category= Category.new(params_category)
      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'La categoria se ha creado exitosamente.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
  end

  def index
    @category=Category.page(params[:page]).per(10)
  end

  def edit
  end

  def  update
    respond_to do |format|
      if @category.update(params_category)
        format.html { redirect_to @category, notice: 'La categoria se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'La categoria ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  private
  def params_category
    params.require(:category).permit(:nombre, :descripcion)
  end
end
