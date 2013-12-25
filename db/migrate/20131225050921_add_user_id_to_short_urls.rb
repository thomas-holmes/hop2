class AddUserIdToShortUrls < ActiveRecord::Migration
  def change
    add_reference :short_urls, :user, index: true, null: true
  end
end
