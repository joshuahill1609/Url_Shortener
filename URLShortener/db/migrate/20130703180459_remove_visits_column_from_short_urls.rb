class RemoveVisitsColumnFromShortUrls < ActiveRecord::Migration
  def change
    remove_column :short_urls, :click_count
  end
end
