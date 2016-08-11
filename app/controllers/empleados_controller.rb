class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit]
  before_action :authenticate_admin!


  def index
    @empleado=Empleado.page(params[:page]).per(10)
  end

  def edit
  end

  def update
      @empleado.update(params_empleado)
  end

  def set_empleado
    @empleado=Empleado.find(params[:id])
  end

  private
  def params_empleado
    params.require(:empleado).permit(:active)
  end

end
