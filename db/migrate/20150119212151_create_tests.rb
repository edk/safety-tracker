class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :test_run, index: true
      t.text :data

      t.timestamps null: false
    end
    add_foreign_key :tests, :test_runs
  end
end
