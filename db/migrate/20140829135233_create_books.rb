class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :img_url
      t.string :state

      t.timestamps
    end
  end
end
