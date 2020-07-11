class CreateBackingTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :backing_tracks do |t|
      t.string :song_title
      t.string :song_part
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
