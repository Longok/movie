class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :code
      t.string :payment_type
      t.integer :cash_number

      t.timestamps
    end
  end
end
