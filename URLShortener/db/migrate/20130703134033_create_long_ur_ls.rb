class CreateLongUrLs < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.text :url

      t.timestamps
    end
  end
end
