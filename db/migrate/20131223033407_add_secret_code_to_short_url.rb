class AddSecretCodeToShortUrl < ActiveRecord::Migration
  def change
    add_column :short_urls, :secret_code, :string

    add_index :short_urls, :secret_code, unique: true
  end
end
