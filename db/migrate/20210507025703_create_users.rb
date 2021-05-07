class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :document
      t.string :sex
      t.string :age
      t.string :height

      t.timestamps
    end
  end
end
