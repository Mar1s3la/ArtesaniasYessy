class ItemsController < ApplicationController
  def show
    @vent_items = current_vent.vent_items
  end
end
