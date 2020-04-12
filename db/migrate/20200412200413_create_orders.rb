class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :pst
      t.integer :gst
      t.integer :hst
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
