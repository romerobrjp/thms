class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :token_authenticatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :type, :login, :cpf

  validates_uniqueness_of     :email, :case_sensitive => false, :allow_blank => false, :if => :email_changed?, :scope => :type
  validates_format_of         :email, :with  => Devise.email_regexp, :allow_blank => false, :if => :email_changed?
  validates_presence_of       :password, :on => :create
  validates_confirmation_of   :password, :on => :create
  validates_length_of         :password, :within => Devise.password_length, :allow_blank => false, :unless => Proc.new { |a| a.password.blank? }


  def self.find_for_authentication(warden_conditions)
    conditions = warden_conditions.dup
    puts conditions
    puts 'TESTANDO'
    where("(cpf = :value OR lower(email) = :value) AND type = :type", {value: conditions[:login], type: conditions[:type]}).first
  end

end
