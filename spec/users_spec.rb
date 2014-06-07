require File.expand_path('../spec_helper.rb', __FILE__)

module GruntSinatra
  describe App do
    include Rack::Test::Methods

    def app
      App
    end

    before do
      DatabaseCleaner.start

      @page = Page.create(
        :h1      => 'Test Header',
        :content => 'Test Content'
      )

      @user = User.create(
        :email    => 'test@user.com',
        :password => 'password'
      )
    end

    after do
      DatabaseCleaner.clean
    end

    describe "signin page" do
      it "should return the content" do
        get '/signin'

        last_response.status.must_equal 200

        last_response.body.must_include '<label for="input-email">Email address</label>'
        last_response.body.must_include '<input type="email" name="email" class="form-control" id="input-email" placeholder="Enter email">'
        last_response.body.must_include '<label for="input-password">Password</label>'
        last_response.body.must_include '<input type="password" name="password" class="form-control" id="input-password" placeholder="Password">'
        last_response.body.must_include '<button type="submit" class="btn btn-default">Sign in</button>'
      end
    end

    describe "signing in" do
      let(:user) { @user }

      it "should fail for incorrect credentials" do
        post '/signin', {
          'email'      => 'non_user@user.com',
          'password'   => 'wrong-password'
        }

        last_response.status.must_equal 401

        last_response.body.must_include 'Incorrect email/password combination. Please try again.'

        last_request.env['rack.session']['user_id'].wont_equal user[:id]
      end

      it "should redirect for correct credentials" do
        post '/signin', {
          'email'      => 'test@user.com',
          'password'   => 'password'
        }

        last_response.status.must_equal 302

        follow_redirect!

        last_response.status.must_equal 200

        last_response.body.must_include 'Test Header'

        last_request.env['rack.session']['user_id']

        last_request.env['rack.session']['user_id'].must_equal user[:id]
      end
    end

    describe "signing out" do
      let(:user) { @user }

      it "should redirect to home page" do
        get '/signout'

        last_response.status.must_equal 302

        follow_redirect!

        last_response.status.must_equal 200

        last_response.body.must_include 'Test Header'

        last_request.env['rack.session']['user_id'].wont_equal user[:id]
      end
    end
  end
end
