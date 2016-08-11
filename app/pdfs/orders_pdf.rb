class OrdersPdf  < Prawn::Document
  def initialize(orden)
    super()
    @order=orden
    header

    header_lead

    table_content
  end


  def header
    text "Orden # #{@order.id}", size: 28

    stroke_color "eeeeee"
    stroke_line [0, 680], [530, 680]
  end

  def header_lead
    y_position = cursor - 30

    bounding_box([100, y_position], :width => 270, :height => 50) do
      font_size 10.5
        text "Cliente:  #{@order.nombre} #{@order.apellido}"
      move_down 3
      text "Fecha:  #{@order.updated_at.strftime("%d-%m-%Y a las %H:%M:%S")}"
    end
  end


  def table_content
    table vent_item_rows do
      cells.padding = 8
      cells.borders = [:bottom,]
      cells.border_width = 0.5

      row(0).border_width = 1.5
      row(-2).border_width = 1.5
      row(-1).background_color = "f0ad4e"
      row(-1).borders = []

      self.header     = true
      self.row_colors = ['dddddd', 'ffffff']
      self.column_widths = [125, 125, 100, 70, 100]
    end
  end

  def vent_item_rows
    arr = [["Producto", "Tamaño", "Cantidad", "Precio", "Subtotal"]]

    @order.order_items.map.with_index do |item|
      arr << [item.producto.producto, item.producto.tamano.tamano, "#{item.quantity} Piez.", "$ #{item.producto.precio}", "$ #{item.total_price}"]
    end

    arr << ["Total", "", "", "", "$ #{@order.subtotal}"]
    return arr
  end
end