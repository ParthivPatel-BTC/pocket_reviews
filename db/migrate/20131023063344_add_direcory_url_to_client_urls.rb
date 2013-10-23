class AddDirecoryUrlToClientUrls < ActiveRecord::Migration
  def change
    add_column :client_urls, :directory_url, :string
  end
end
