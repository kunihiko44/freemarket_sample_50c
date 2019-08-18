class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,                    null: false, index: true
      t.text       :introduction,            null: false
      t.integer    :price,                   null: false
      t.string     :size,                    null: false
      t.integer    :state,                   null: false
      t.bigint     :user,                    null: false, foreign_key: true
      t.bigint     :brand,                                foreign_key: true
      t.bigint     :category,                             foreign_key: true
      t.string     :deal_state,              null: true
      t.integer    :delivery_date,           null: false
      t.integer    :delivery_cost,           null: false
      t.integer    :delivery_method,         null: false
      t.string     :prefecture_id,           null: false
      t.timestamps
    end
  end
end