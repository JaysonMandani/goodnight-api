class CreateSleepTrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_trackers do |t|
      t.datetime :clock_in, null: false, default: Time.now
      t.datetime :clock_out
      t.float :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
