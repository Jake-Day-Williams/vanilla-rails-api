class User < ApplicationRecord
  # Assign API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end

end
