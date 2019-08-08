class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,                    null: false, index: true
      t.text       :introduction,            null: false
      t.integer    :price,                   null: false
      t.string     :size,                    null: false
      t.integer    :state,                   null: false
      t.bigint     :user_id,                 null: false, foreign_key: true
      t.bigint     :brand_id,                             foreign_key: true
      t.bigint     :category_id,                          foreign_key: true
      t.string     :deal_state,              null: true
      t.integer    :delivery_date,           null: false
      t.integer    :delivery_cost,           null: false
      t.integer    :delivery_method,         null: false
      t.integer    :delivery_prefecture,     null: false
      t.timestamps
    end
  end
end