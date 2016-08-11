class Producto < ActiveRecord::Base
  has_many :vent_items

  has_and_belongs_to_many :category
  has_and_belongs_to_many :disenos

  belongs_to :tamano
  
  validates :producto, presence:{ message: 'El nombre del producto es requerido' }, length: { in: 3..50 , message: 'La longitud del producto debe de ser de entre 3 a 50 caracteres'}
  validates :descripcion, presence:{ message: 'La descripcion del producto es requerida' }, length: { in: 3..50 , message: 'La longitud de la descripcion debe de ser de entre 3 a 50 caracteres'}
  validates :largo, presence:{ message: 'El largo en centimetros del producto es requerido' }
  validates :alto, presence:{ message: 'El largo en centimetros del producto es requerido' }
  validates :ancho, presence:{ message: 'El largo en centimetros del producto es requerido' }
  validates :precio, presence:{ message: 'El precio del producto es requerido' }
  validates :diseno_ids, presence:{ message: 'Almenos un diseño del producto es requerido' }
  validates :category_ids, presence:{ message: 'Almenos una categoria del producto es requerido' }


  has_many :productos_vents
  has_many :vents, through: :productos_vents

  validates :producto, uniqueness: {scope: :tamano_id , message: 'Este producto con este tamaño ya existe'}



  mount_uploader :fotografia, FotografiaUploader
  validates_processing_of :fotografia
  validate :fotografia_size_validation
  private
  def fotografia_size_validation
    errors[:fotografia] << "Debe de ser menor a 2 MB" if fotografia.size > 2.megabytes
  end


end
