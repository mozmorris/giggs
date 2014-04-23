module GruntSinatra
  module Routes
    autoload :Base, 'app/routes/base'
    autoload :Static, 'app/routes/static'

    autoload :Users, 'app/routes/users'
    autoload :Pages, 'app/routes/pages'
  end
end
