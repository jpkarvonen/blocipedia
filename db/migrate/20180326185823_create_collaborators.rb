class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
      t.integer :wiki_id
      t.integer :user_id
      t.timestamps
    end
    
  
    add_index :collaborator_wikis, :wiki_id
    add_index :collaborator_users, :user_id
    
  end
end
