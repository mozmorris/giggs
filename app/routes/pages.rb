module GruntSinatra
  module Routes
    class Pages < Base
      get '/' do
        @page = Page.first

        erb :index
      end

      put '/pages/:id', :auth => true, :provides => :json do
        @page = Page[params[:id]]

        return false unless @page

        properties = Page.extract_properties(params)

        json @page.update(properties)
      end
    end
  end
end
