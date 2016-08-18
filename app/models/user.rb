class User < ActiveRecord::Base
  has_secure_password
  has_many :books

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
