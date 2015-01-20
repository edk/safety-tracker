class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :user
      t.string :token

      t.timestamps null: false
    end
  end
end
