class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :test_run, index: true
      t.binary :data, limit: 5.megabytes

      t.timestamps null: false
    end
    add_foreign_key :tests, :test_runs
  end
end
