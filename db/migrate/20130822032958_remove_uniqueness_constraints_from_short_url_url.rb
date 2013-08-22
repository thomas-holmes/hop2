class RemoveUniquenessConstraintsFromShortUrlUrl < ActiveRecord::Migration
  def change
    remove_index :short_urls, :url
    add_index :short_urls, :url, unique: false
  end
end
