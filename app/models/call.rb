class Call < ActiveRecord::Base
  include Workflow

  belongs_to :tenement
  has_many :answers, :as => :answerable, :dependent => :destroy
  has_many :attachments, :as => :attachable, :dependent => :destroy

  accepts_nested_attributes_for :attachments

  attr_accessible :message, :public, :subject, :draft, :sent_at, :attachments_attributes, :attachments

  workflow do
    state :draft do
      event :publish, :transitions_to => :published
    end

    state :published do
      event :reject, :transitions_to => :rejected
      event :accept, :transitions_to => :accepted
    end
    state :accepted

    state :rejected do
      event :reopen, :transitions_to => :published
    end
  end

  def publish
    self.update_attribute(:sent_at, Time.now)
  end

end
