require "schemap/version"

module Schemap
  class Railtie < Rails::Railtie
    initializer "Loading Schemap" do
      ActiveSupport.on_load(:action_controller) do
        include Schemap
      end
    end
  end

  class Schemap
    def self.generate_schema
      p Rails.root

      db = ActiveRecord::Base.connection
      db.tables.map do |table|
        {table =>
          {attributes:
             (db.columns(table).map(&:name)),
           associations:
              table.classify.constantize.reflections.map { |r|
                r[1].table_name
              }
          }
        }
      end
    end
  end
end
