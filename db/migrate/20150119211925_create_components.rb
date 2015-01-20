class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :components, :name, unique: true
  end
end
