class CreateApiSlugApiKeys < ActiveRecord::Migration
  def change
    create_table :api_slug_api_keys do |t|
      t.string :access_token
      t.references :user, index: true

      t.timestamps
    end
  end
end
