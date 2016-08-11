class Cliente < ActiveRecord::Base
  has_many :orders
end
