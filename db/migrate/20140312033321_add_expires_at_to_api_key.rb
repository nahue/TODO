class AddExpiresAtToApiKey < ActiveRecord::Migration
  def change
    add_column :api_keys, :expires_at, :timestamp
  end
end
