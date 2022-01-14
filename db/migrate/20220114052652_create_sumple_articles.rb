class CreateSumpleArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :sumple_articles do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
