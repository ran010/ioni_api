class AddBatchToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :batch, :string
  end
end
