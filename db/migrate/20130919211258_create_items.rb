class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :project

      t.timestamps
    end
    add_index :items, :project_id
  end
end
