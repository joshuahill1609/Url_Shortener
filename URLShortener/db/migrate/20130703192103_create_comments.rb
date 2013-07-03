class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :short_url_id
      t.integer :user_id

      t.timestamps
    end
  end
end
