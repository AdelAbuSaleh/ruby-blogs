class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :full_name_ar
      t.string :full_name_en
      t.string  :user_name
      t.string :email
      t.string :password_digest, null: false
      t.integer :country_code
      t.string :mobile1
      t.string :mobile2
      t.string :mobile3
      t.timestamps
    end
  end
end
