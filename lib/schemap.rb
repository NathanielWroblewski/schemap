require 'schemap/version'
require 'active_support/core_ext/string/inflections'

module Schemap
  class Schemap
    def self.generate_schema(rails_app)
      db = rails_app.constantize::ActiveRecord::Base.connection
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
