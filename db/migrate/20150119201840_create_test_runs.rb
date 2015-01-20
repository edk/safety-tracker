class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.string :name
      t.string :url
      t.string :branch

      t.timestamps null: false
    end
  end
end
