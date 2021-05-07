class CreateHobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :hobbies do |t|
      t.number :user_id
      t.string :name

      t.timestamps
    end
  end
end
