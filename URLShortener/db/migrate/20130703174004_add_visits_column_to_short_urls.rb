class AddVisitsColumnToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :click_count, :integer
  end
end