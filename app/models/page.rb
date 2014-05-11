module GruntSinatra
  module Models
    class Page < Sequel::Model
      def self.get(id)
        first(id: id)
      end

      def self.extract_properties(properties)
        {
          :h1      => properties['<http://viejs.org/ns/h1>'],
          :content => properties['<http://viejs.org/ns/content>']
        }
      end
    end
  end
end
