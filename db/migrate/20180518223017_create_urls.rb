class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original
      t.text :url_safe
      t.timestamps null: false
    end
  end
end
