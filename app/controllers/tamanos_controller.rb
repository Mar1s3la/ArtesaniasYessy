class TamanosController < ApplicationController
  before_action :set_tamano, except: [:index, :new, :create]
  before_action :authenticate!


  def new
    @tamano=Tamano.new
  end

  def create
    @tamano = Tamano.new(params_tamano)
    respond_to do |format|
      if @tamano.save
        format.html { redirect_to @tamano, notice: 'El tamaño se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @tamano }
      else
        format.html { render :new }
        format.json { render json: @tamano.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @tamano = Tamano.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tamano.update(params_tamano)
        format.html { redirect_to @tamano, notice: 'El tamaño se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tamano }
      else
        format.html { render :edit }
        format.json { render json: @tamano.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tamano.destroy
    respond_to do |format|
      format.html { redirect_to tamanos_path, notice: 'El tamaño ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  def set_tamano
    @tamano = Tamano.friendly.find(params[:id])
  end

  private
  def params_tamano
    params.require(:tamano).permit(:tamano, :descripcion)
  end
end
