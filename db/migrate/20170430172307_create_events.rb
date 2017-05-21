class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :date
      t.text :location
      t.integer :number_of_tas
      t.text :description
      t.string :start_time
      t.string :end_time
      t.string :meetup_url

      t.timestamps
    end
  end
end
