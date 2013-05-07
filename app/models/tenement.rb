class Tenement < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :townhouse

  has_many :calls
  attr_accessible :location, :rent_value, :tenant_id, :townhouse_id
end
