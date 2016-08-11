class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nombre, use: :slugged

  has_and_belongs_to_many :productos

  validates :nombre, presence:{ message: 'El nombre es requerido' }, length: { in: 3..35 , message: 'La longitud de la categoria debe de ser de entre 3 a 50 caracteres'}
  validates :descripcion, presence: { message: 'La descripcion de la categoria es requerida' }

  validates :nombre, uniqueness: {case_sensitive: false ,message: "Esa categoria ya se encuantra registrada!"}
end
