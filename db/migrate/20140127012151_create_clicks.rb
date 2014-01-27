class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :short_url, index: true

      t.timestamps
    end
  end
end
