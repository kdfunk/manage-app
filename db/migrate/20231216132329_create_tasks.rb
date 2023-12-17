class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :manage, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :status
      t.string :manage
      t.string :references

      t.timestamps
    end
  end
end
