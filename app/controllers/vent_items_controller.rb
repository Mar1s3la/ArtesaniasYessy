class VentItemsController < ApplicationController
  def create
    @vent = current_vent
    @vent_item = @vent.vent_items.new(order_item_params)
    @vent.empleado.build
    @vent.save
    render :js => "window.location = '/item';"
  end

  def update
    @vent = current_vent
    @vent_item = @vent.vent_items.find(params[:id])
    @vent_item.update_attributes(order_item_params)
    @vent_items = @vent.vent_items
  end

  def destroy
    @vent = current_vent
    @vent_item = @vent.vent_items.find(params[:id])
    @vent_item.destroy
    @vent_items = @vent.vent_items
  end

  private
  def order_item_params
    params.require(:vent_item).permit(:quantity, :producto_id, :diseno_id)
  end
end