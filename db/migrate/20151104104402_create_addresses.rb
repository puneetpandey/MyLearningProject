class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to      :post
      t.text            :address_line_1
      t.text            :address_line_2
      t.string          :city
      t.string          :state
      t.integer         :pincode
      t.string          :address_type
      t.timestamps null: false
    end
    add_index :addresses, :city
    add_index :addresses, :state
  end
end
