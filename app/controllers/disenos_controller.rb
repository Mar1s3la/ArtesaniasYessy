class DisenosController < ApplicationController
  before_action :set_disenos, except: [:index, :new, :create]
  before_action :authenticate!

  def new
    @diseno=Diseno.new
  end

  def create
    @diseno= Diseno.new(params_disenos)

    respond_to do |format|
      if @diseno.save
        format.html { redirect_to @diseno, notice: 'El diseño se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @diseno }
      else
        format.html { render :new }
        format.json { render json: @diseno.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def index
    @diseno=Diseno.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @diseno.update(params_disenos)
        format.html { redirect_to @diseno, notice: 'El diseño se ha actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @diseno }
      else
        format.html { render :edit }
        format.json { render json: @diseno.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diseno.destroy
    respond_to do |format|
      format.html { redirect_to disenos_path, notice: 'El diseño ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  def set_disenos
    @diseno=Diseno.friendly.find(params[:id])
  end

  private
  def params_disenos
    params.require(:diseno).permit(:nombre, :diseno)
  end


end
