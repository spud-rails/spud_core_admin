module SpudAdmin
  module TestFiles
    class << self
      def load_all
        load_specs
        load_factories
      end
      def load_specs
        Dir[File.join(File.expand_path('../../../', __FILE__), "spec/**/*_spec.rb")].each {|f| require f}
      end
  
      def load_factories
        Dir[File.join(File.expand_path('../../../', __FILE__), "factories/*")].each {|f| require f}
      end
    end
  end
end
