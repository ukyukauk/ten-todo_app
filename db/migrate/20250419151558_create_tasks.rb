class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.date :deadline
      t.timestamps
    end
  end
end
