class AddLastNameKanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Last_name_kana, :string
  end
end
