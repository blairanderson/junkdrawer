class CreateApiCaches < ActiveRecord::Migration
  def change
    create_table :api_caches do |t|
      t.references :user, index: true
      t.string :endpoint
      t.hstore :settings

      t.timestamps
    end
  end
end
