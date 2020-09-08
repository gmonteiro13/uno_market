class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :social_name
      t.date :birth_date
      t.string :job
      t.string :department

      t.timestamps
    end
  end
end
