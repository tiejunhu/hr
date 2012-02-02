class AddAuthlogicToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :login, :string
    add_column :humen, :crypted_password, :string
    add_column :humen, :password_salt, :string
    add_column :humen, :persistence_token, :string
  end
end
