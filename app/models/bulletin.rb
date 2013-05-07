class Bulletin < ActiveRecord::Base
  include Workflow

  belongs_to :syndic
  belongs_to :townhouse
  has_many :attachments, :as => :attachable, :dependent => :destroy
  has_many :answers, :as => :answerable, :dependent => :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true

  attr_accessible :subject, :message, :sent_at, :syndic_id, :townhouse_id, :attachments_attributes, :attachments

  workflow do
    state :draft do
      event :publish, :transitions_to => :published
    end

    state :published do
      event :revoke, :transitions_to => :revoked
    end
    state :revoke
  end

  def publish(current_user)
    self.update_attribute(:sent_at, Time.now)
    TenantMailer.new_bulletin_email(townhouse, self, current_user).deliver
  end

end
