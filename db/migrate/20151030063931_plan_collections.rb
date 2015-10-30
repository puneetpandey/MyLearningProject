class PlanCollections < ActiveRecord::Migration
  def change
    create_table :plan_collections, id: false do |t|
      t.integer :plan_id
      t.integer :collection_id
    end
  end
end
