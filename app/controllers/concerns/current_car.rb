module CurrentCar
    extend ActiveSupport::Concern
    private
    def set_vent
      @vent = Vent.find(session[:vent_id])

    rescue ActiveRecord::RecordNotFound

      @vent = Vent.create

      session[:vent_id] = @vent.id

  end

end