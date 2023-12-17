class CreateManages < ActiveRecord::Migration[7.1]
  def change
    create_table :manages do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
