class Syndic < User

  has_and_belongs_to_many :townhouses, foreign_key: 'syndic_id'
  has_many :phones, :as => :phoneable
  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, allow_destroy: true

  attr_accessible :name, :active, :cpf, :address_attributes, :phones_attributes


end