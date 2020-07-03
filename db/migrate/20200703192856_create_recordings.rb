class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :part
      t.string :title

      t.timestamps
    end
  end
end
