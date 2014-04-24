module GruntSinatra
  module Models
    class Page < Sequel::Model
      def self.get(id)
        first(id: id)
      end

      def self.extract_properties(properties)
        {
          :h1    => properties['<http://viejs.org/ns/h1>'],
          :h2    => properties['<http://viejs.org/ns/h2>'],
          :intro => properties['<http://viejs.org/ns/intro>']
        }
      end
    end
  end
end
