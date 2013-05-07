class Tenant < User
  
  has_many :tenements
#  has_many :townhouses, :through => :tenements
  has_many :phones, :as => :phoneable
  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, allow_destroy: true

  attr_accessible :name, :cpf, :active, :address_attributes, :phones_attributes


  def cpf_name
    "#{self.cpf} - #{self.name}"
  end
end