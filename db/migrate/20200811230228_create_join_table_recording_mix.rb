class CreateJoinTableRecordingMix < ActiveRecord::Migration[6.0]
  def change
    create_join_table :mixes, :recordings do |t|
      # t.index [:mix_id, :recording_id]
      # t.index [:recording_id, :mix_id]
    end
  end
end
