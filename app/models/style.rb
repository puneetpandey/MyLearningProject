class Style < ActiveRecord::Base
  has_and_belongs_to_many :plans, join_table: 'plan_styles', foreign_key: 'style_id', association_foreign_key: 'plan_id'
end
