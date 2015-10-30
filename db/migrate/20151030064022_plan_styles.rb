class PlanStyles < ActiveRecord::Migration
  def change
    create_table :plan_styles, id: false do |t|
      t.integer :plan_id
      t.integer :style_id
    end
  end
end
