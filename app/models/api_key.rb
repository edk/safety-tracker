
class ApiKey < ActiveRecord::Base

  def self.create_api_token(params = {})
    begin
      token = ApiKey.new params.merge(token: generate_new_auth_token)
      token.save!
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    token
  end

  def encoded
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  protected

  def self.generate_new_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.exists?(token: token)
    end
  end

end
