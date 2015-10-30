class PlanFeatures < ActiveRecord::Migration
  def change
    create_table :plan_features, id: false do |t|
      t.integer :plan_id
      t.integer :feature_id
    end
  end
end
