require 'bcrypt'

module GruntSinatra
  module Models
    class User < Sequel::Model
      def self.get(id)
        first(id: id)
      end

      def authenticate(unencrypted_password)
        if BCrypt::Password.new(password_digest) == unencrypted_password
          self
        else
          false
        end
      end

      private

        def password=(unencrypted_password)
          @password = unencrypted_password
          unless unencrypted_password.blank?
            self.password_digest = BCrypt::Password.create(unencrypted_password)
          end
        end
    end
  end
end
