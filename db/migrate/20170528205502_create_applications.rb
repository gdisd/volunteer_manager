class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.text :about_you
      t.text :how_you_found_us
      t.text :why_volunteer
      t.references :user

      t.timestamps
    end
  end
end
