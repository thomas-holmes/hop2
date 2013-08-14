class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :short_code

      t.timestamps
    end
    add_index :short_urls, :url, unique: true
    add_index :short_urls, :short_code, unique: true
  end
end
