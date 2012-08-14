class CreateCustomerTable < ActiveRecord::Migration
  def change
    create_table :customers do |c|
      c.string :first_name
      c.string :last_name
    end
  end
end
