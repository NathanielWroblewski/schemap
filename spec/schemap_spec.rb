require 'spec_helper'
require_relative '../lib/schemap'

describe Schemap, '#generate_schema'

end





# default to default schema location
# error if no schema


# describe Schemap::SchemaParser, '.replicate' do
#   it 'maps tables to associations and attributes' do

#   end
# end


# db = ActiveRecord::Base.connection
# db.tables.map do |table|
#   {table =>
#     {attributes:
#        (db.columns(table).map(&:name)),
#      associations:
#         table.classify.constantize.reflections.map { |r|
#           r[1].table_name
#         }
#     }
#   }
# end
