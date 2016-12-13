class User < ActiveRecord::Base
  has_secure_password
  
  has_many :books
  has_many :reviews

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
  
  def is_authorized?
    current_user == @user  
  end

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :email, format: {with: /@/}

end
