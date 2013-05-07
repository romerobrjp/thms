class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true
  attr_accessible :description, :number, :phoneable_id, :phoneable_type
end
