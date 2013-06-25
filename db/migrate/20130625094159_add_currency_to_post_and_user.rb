class AddCurrencyToPostAndUser < ActiveRecord::Migration
  def change
    add_column :users, :currency, :string, default: '$'
    add_column :posts, :currency, :string, default: '$'
  end
end
