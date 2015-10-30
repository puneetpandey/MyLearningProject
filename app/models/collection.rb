class Collection < ActiveRecord::Base
  has_and_belongs_to_many :plans, join_table: 'plan_collections', foreign_key: 'collection_id', association_foreign_key: 'plan_id'
end
