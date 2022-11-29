class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    add_reference :notes, :user, foreign_key: true
  end
end
