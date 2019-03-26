class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: {case_sensitive: false, message: "No duplicates"}, presence: true, format: {with: /\A[a-zA-Z]+\z/}
    validates :password, presence: true, confirmation: true, length: {minimum: 3}

    def self.authenticate_with_credentials(email, password)
    puts email.strip, password
        user = find_by_email(email.strip)
    puts user

        if user && user.authenticate(password)
            return user
        else
            return nil
      end
    end
end
