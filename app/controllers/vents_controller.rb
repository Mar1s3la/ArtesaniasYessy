class VentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @vents=Vent.all.where("total > 0").order("updated_at DESC")
  end

  def show
    @vent=Vent.find(params[:id])

    respond_to do |format|
      format.html
      format.xls
      format.pdf do
        pdf = VentsPdf.new(@vent)
        send_data pdf.render,
                  filename: "venta-#{@vent.id}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end
end
