class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order=Order.find(params[:id])
    respond_to do |format|
      format.html
      format.xls
      format.pdf do
        pdf = OrdersPdf.new(@order)
        send_data pdf.render,
                  filename: "orden-#{@order.id}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end
end
