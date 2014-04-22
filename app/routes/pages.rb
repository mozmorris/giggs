module GruntSinatra
  module Routes
    class Pages < Base
      get '/' do
        erb :index
      end
    end
  end
end
