module GruntSinatra
  module Routes
    class Users < Base
      register Sinatra::Flash

      get '/login' do
        erb :login
      end

      post '/login' do
        user = User.first(email: params[:email])

        if user && user.authenticate(params[:password])
          sign_in user
          redirect to('/')
        else
          flash.now[:error] = 'Incorrect email/password combination. Please try again.'
          erb :login
        end
      end

      get '/logout' do
        session.destroy

        redirect to('/')
      end
    end
  end
end
