class RemoveShortUrlId < ActiveRecord::Migration
  def change
    remove_column :tag_topics, :short_url_id
  end
end
