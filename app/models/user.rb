class User < ApplicationRecord
  self.table_name = "user"
  self.primary_key = "id"

  def authenticate(password_digest, password)
    password_hash = Digest::MD5.hexdigest(password).upcase

    if password_digest == password_hash
        return true
    end 

      return false
  end
end
