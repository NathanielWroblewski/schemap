require 'schemap/version'
require 'active_support/all'

module Schemap
  class Schemap
    def self.generate_schema(db)
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
