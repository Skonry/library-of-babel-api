class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = user()
    if user
      {
        :jwt => JsonWebToken.encode(user_id: user.id),
        :user => user
      }
    end
  end

  private

  attr_accessor :email, :password
  
  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
  
end