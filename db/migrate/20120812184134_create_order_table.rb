class CreateOrderTable < ActiveRecord::Migration
  def change
    create_table :orders do |o|
      o.integer :customer_id
      o.float :price
    end
  end
end
