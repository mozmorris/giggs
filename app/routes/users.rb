module GruntSinatra
  module Routes
    class Users < Base
      register Sinatra::Flash

      get '/signin' do
        erb :signin
      end

      post '/signin' do
        user = User.first(email: params[:email])

        if user && user.authenticate(params[:password])
          sign_in user
          redirect to('/')
        else
          flash.now[:error] = 'Incorrect email/password combination. Please try again.'

          status 401

          erb :signin
        end
      end

      get '/signout' do
        session.destroy

        redirect to('/')
      end
    end
  end
end
