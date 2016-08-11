class Tamano < ActiveRecord::Base
  extend FriendlyId
  friendly_id :tamano, use: :slugged
  has_many :productos, dependent: :destroy

  validates :tamano, presence:{ message: 'El tamaño es requerido' }, length: { in: 5..35 ,message: 'La longitud del tamaño debe de ser de entre 5 a 35 caracteres'}
  validates :descripcion, presence: { message: 'La descripcion es requerida' }

  validates :tamano, uniqueness: {case_sensitive: false ,message: "Ese tamaño ya se encuantra registrado!"}
end
