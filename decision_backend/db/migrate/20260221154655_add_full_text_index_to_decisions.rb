class AddFullTextIndexToDecisions < ActiveRecord::Migration[7.1]
  def change
    add_index :decisions, [:title, :description], type: :fulltext
  end
end
