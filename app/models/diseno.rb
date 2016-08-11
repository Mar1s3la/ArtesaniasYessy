class Diseno < ActiveRecord::Base
  belongs_to :vent_item

  extend FriendlyId
  friendly_id :nombre, use: :slugged

  has_and_belongs_to_many :productos

  validates :nombre, presence:{ message: 'El nombre del diseño es requerido' }, length: { in: 4..35 , message: 'La longitud del nombre debe de ser de entre 4 a 35 caracteres'}
  validates :diseno, presence:{ message: 'El diseño es requerido' }

  validates :nombre, uniqueness: {case_sensitive: false ,message: "Ese diseño ya se encuantra registrado!"}


  mount_uploader :diseno, DisenoUploader
  validates_processing_of :diseno
  validate :diseno_size_validation
  private
  def diseno_size_validation
    errors[:diseno] << "Debe de ser menor a 2 MB" if diseno.size > 2.megabytes
  end
end
