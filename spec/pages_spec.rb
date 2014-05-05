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
        :h1       => 'Test Header',
        :h2       => 'Test Sub-header',
        :intro    => 'Test Intro'
      )

      @user = User.create(
        :name     => 'Test User',
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
        last_response.body.must_include @page[:h2]
        last_response.body.must_include @page[:intro]
      end
    end

    describe "updating content" do
      let(:updated1) { Page[@page[:id]] }
      let(:updated2) { Page[@page[:id]] }

      it "should fail for unauthorized users" do
        put '/pages/' + @page[:id].to_s, {
          '<http://viejs.org/ns/h1>'    => 'Test Header (updated)',
          '<http://viejs.org/ns/h2>'    => 'Test Sub-header (updated)',
          '<http://viejs.org/ns/intro>' => 'Test Intro (updated)'
        }

        last_response.status.must_equal 303

        updated1[:h1].wont_include "Test Header (updated)"
        updated1[:h2].wont_include "Test Sub-header (updated)"
        updated1[:intro].wont_include "Test Intro (updated)"
      end

      it "should update for authorized users" do
        put '/pages/' + @page[:id].to_s, {
          '<http://viejs.org/ns/h1>'    => 'Test Header (updated)',
          '<http://viejs.org/ns/h2>'    => 'Test Sub-header (updated)',
          '<http://viejs.org/ns/intro>' => 'Test Intro (updated)'
        }, 'rack.session' => { :user_id => @user[:id] }

        last_response.status.must_equal 200

        updated2[:h1].must_include "Test Header (updated)"
        updated2[:h2].must_include "Test Sub-header (updated)"
        updated2[:intro].must_include "Test Intro (updated)"
      end
    end
  end
end
