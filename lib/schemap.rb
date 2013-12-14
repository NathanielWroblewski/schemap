require "schemap/version"

module Schemap
  class Schemap
    def self.generate_schema
      app_root = Pathname.new(File.expand_path('../../', __FILE__))
      p app_root
      p app_root.basename
      blah = app_root.basename.to_s
      p blah

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
