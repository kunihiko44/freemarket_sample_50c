class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,                    null: false, index: true
      t.text       :introduction,            null: false
      t.string     :category_id,             null: false, foreign_key: true
      t.string     :size
      t.string     :state_id,                null: false
      t.string     :delivery_cost_id,        null: false
      t.string     :delivery_method_id,      null: false
      t.string     :prefecture_id,           null: false
      t.integer    :price,                   null: false
      t.bigint     :brand,                                foreign_key: true
      t.string     :delivery_date_id,        null: false
      t.string     :user_id,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end