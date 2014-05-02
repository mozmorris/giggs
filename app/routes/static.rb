module GruntSinatra
  module Routes
    class Static < Sinatra::Application
      configure do
        set :root, File.expand_path('../../../', __FILE__)
        disable :method_override
        disable :protection
        enable :static
      end

      configure :development, :test do
        set :public_folder, Proc.new { File.join(root, 'dev') }
      end

      configure :production do
        set :public_folder, Proc.new { File.join(root, 'public') }
      end
    end
  end
end
