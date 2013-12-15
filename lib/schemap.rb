require "#{Dir.pwd}/config/environment.rb"

db_config = YAML.load_file("#{Dir.pwd}/config/database.yml")
ActiveRecord::Base.establish_connection db_config['development']
db_connection = ActiveRecord::Base.connection
table_names = db_connection.tables
table_names.shift # remove rails schema_migration table

tables = table_names.map do |table_name|
  { name: table_name }
end

associations = table_names.flat_map do |table|
  table.classify.constantize.reflections.map do |reflection|
    { source: tables.index(name: table),
      target: tables.index(name: reflection[1].table_name),
      value: rand(1..5)
    }
  end
end

attrs = table_names.map do |table|
  { table: table, attrs: db_connection.columns(table).map(&:name) }
end

puts YAML.dump({nodes: tables, links: associations, attributes: attrs})
