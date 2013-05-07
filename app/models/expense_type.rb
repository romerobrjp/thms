class ExpenseType < ActiveRecord::Base
  belongs_to :townhouse
  has_many :expenses, foreign_key: 'type_id'
  attr_accessible :description, :name, :townhouse_id

  def total_value_per_month
    total = 0
    self.expenses.each do |expense|
      total += expense.value
    end
    return total
  end
end
