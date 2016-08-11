class Catalogo < ActiveRecord::Base
  validates :diseno_ids, presence:{ message: 'Almenos un diseño del producto es requerido' }
end
