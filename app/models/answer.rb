class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: 'Answer'
  belongs_to :answerable, polymorphic: true
  has_many :attachments, :as => :attachable, :dependent => :destroy

  accepts_nested_attributes_for :attachments

  attr_accessible :message, :answerable_id, :answerable_type, :attachments_attributes, :attachments
end
