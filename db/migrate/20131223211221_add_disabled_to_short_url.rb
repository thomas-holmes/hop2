class AddDisabledToShortUrl < ActiveRecord::Migration
  def change
    add_column :short_urls, :disabled, :boolean
  end
end
