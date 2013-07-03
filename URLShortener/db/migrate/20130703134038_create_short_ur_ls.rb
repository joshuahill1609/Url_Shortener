class CreateShortUrLs < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.text :s_url
      t.integer :long_url_id
      t.integer :user_id

      t.timestamps
    end
  end
end
