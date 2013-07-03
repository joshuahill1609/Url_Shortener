class AddTagsIdColumnToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :tag_topic_id, :integer
  end
end
