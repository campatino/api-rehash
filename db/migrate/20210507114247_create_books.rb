class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :language
      t.integer :pages
      t.integer :year

      t.timestamps
    end
  end
end
