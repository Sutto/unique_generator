require 'reversible_data'

ReversibleData.in_memory!
ReversibleData.add :users do |t|
  t.string :name
  t.string :token
end

MongoMapper.database = 'unique_generator_test'