class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      t.string :ops
      t.belongs_to :document
      t.timestamps
    end
  end
end
