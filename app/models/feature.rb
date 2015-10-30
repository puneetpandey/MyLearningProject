class Feature < ActiveRecord::Base
  has_and_belongs_to_many :plans, join_table: 'plan_features', foreign_key: 'feature_id', association_foreign_key: 'plan_id'
end
