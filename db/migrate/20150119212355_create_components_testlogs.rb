class CreateComponentsTestlogs < ActiveRecord::Migration
  def change
    create_table :component_testlogs do |t|
      t.integer :component_id, null: false
      t.integer :test_id, null: false
      t.index [:component_id, :test_id]
    end
  end
end
