class CatalogoController < ApplicationController
  before_action :authenticate_empleado!

  def index
    @productos = Producto.all
    @vent_item = current_vent.vent_items.new
  end

end
