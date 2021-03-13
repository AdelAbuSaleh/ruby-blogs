class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name_ar
      t.string :name_en
      t.timestamps
    end

    # intilize first and defaylt Category
    category = Category.create(name_ar: 'default', name_en: 'default')
    # add category refrance to posts
    add_reference :posts, :category, foreign_key: true, index: true
    # Link exisist posts with default category
    reversible do |dir|
      dir.up do
        Post.where(category_id: nil).update_all(category_id: category.id)
      end
    end

    change_column_null :posts, :category_id, false
    add_column :posts, :is_public, :boolean, default: true
  end
end
