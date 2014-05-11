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

    describe "the page" do
      it "should return the content" do
        get '/'

        last_response.status.must_equal 200

        last_response.body.must_include @page[:h1]
        last_response.body.must_include @page[:content]
      end
    end

    describe "updating content" do
      let(:updated1) { Page[@page[:id]] }
      let(:updated2) { Page[@page[:id]] }

      it "should fail for unauthorized users" do
        put '/pages/' + @page[:id].to_s, {
          '<http://viejs.org/ns/h1>'      => 'Test Header (updated)',
          '<http://viejs.org/ns/content>' => 'Test Content (updated)'
        }

        last_response.status.must_equal 303

        updated1[:h1].wont_include "Test Header (updated)"
        updated1[:content].wont_include "Test Content (updated)"
      end

      it "should update for authorized users" do
        put '/pages/' + @page[:id].to_s, {
          '<http://viejs.org/ns/h1>'      => 'Test Header (updated)',
          '<http://viejs.org/ns/content>' => 'Test Content (updated)'
        }, 'rack.session' => { :user_id => @user[:id] }

        last_response.status.must_equal 200

        updated2[:h1].must_include "Test Header (updated)"
        updated2[:content].must_include "Test Content (updated)"
      end
    end
  end
end
