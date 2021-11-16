class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :created_at, :datetime # method to add columns
    add_column :articles, :updated_at, :datetime
  end
end
