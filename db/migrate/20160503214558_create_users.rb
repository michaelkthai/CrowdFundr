class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
