class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_number
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
