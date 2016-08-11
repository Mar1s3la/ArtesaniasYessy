class ProductosController < ApplicationController
  before_action :set_productos, except: [:index, :new, :create]
  before_action :authenticate!

  def new
     @producto=Producto.new
  end

  def create
    @producto= Producto.new(params_producto)
    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'El producto se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def index
      @producto=Producto.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @producto.update(params_producto)
        format.html { redirect_to @producto, notice: 'El producto se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_path, notice: 'El producto ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  def set_productos
    @producto=Producto.find(params[:id])
  end

  private
  def params_producto
    params.require(:producto).permit(:fotografia,
                                     :producto, :descripcion, :tamano_id,:largo, :ancho,
                                     :alto, :precio,
                                     {:diseno_ids =>[]} , {:category_ids =>[]})
  end

end
