class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, foreign_key: true , index: true
      t.integer :status , default: 0 , index: true
      t.integer :resolved_by_id

      t.timestamps
    end
  end
end
