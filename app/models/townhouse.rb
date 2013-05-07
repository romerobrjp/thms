class Townhouse < ActiveRecord::Base
  
  has_many :tenements
#  has_many :tenants, :through => :tenements, :source => :user
  has_many :bulletins
  has_many :expenses
  has_many :incomes
  has_many :expense_types
  has_many :income_types
  has_many :phones, :as => :phoneable
  has_and_belongs_to_many :syndics
  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, allow_destroy: true

  attr_accessible :information, :name, :address_attributes, :phones_attributes, :syndic_ids
end
