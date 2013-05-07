class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :addressable, polymorphic: true

  attr_accessible :district, :number, :street, :zip_code, :complement, :addressable_id, :addressable_type, :city_id, :state_id

  def full_address
    return "#{self.street}, #{self.number}, #{self.district}, #{self.city.name} - #{self.state.abbreviation}. #{self.zip_code}"
  end
end
