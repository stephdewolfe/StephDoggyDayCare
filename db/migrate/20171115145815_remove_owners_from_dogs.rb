class RemoveOwnersFromDogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :dogs, :owner, :string
  end
end
