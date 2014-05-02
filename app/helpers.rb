module GruntSinatra
  module Helpers
    def sign_in(user)
      session[:user_id] = user.id
      current_user = user
    end

    def signed_in?
      !@user.nil?
    end

    def current_user
      @user ||= user_from_id
    end

    def current_user=(user)
      @user = user
    end

    private

      def user_from_id
        id = session[:user_id]
        User[id] unless id.nil?
      end
  end
end
