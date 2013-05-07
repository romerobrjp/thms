class IncomeType < ActiveRecord::Base
  belongs_to :townhouse
  has_many :incomes, foreign_key: 'type_id'
  attr_accessible :description, :name, :townhouse_id
end
