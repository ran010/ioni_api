class AddFieldsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :members, :string
    add_column :projects, :batch, :string
    add_column :projects, :language, :string
  end
end
