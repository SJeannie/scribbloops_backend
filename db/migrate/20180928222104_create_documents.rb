class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.belongs_to :portfolio, foreign_key: true
      t.boolean :isPublic, default: false

      t.timestamps
    end
  end
end
