class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :recipient_name, null: false
      t.string :recipient_email, null: false
      t.string :sender_name, null: false
      t.string :sender_email, null: false
      t.string :image_url, null: false
      t.text :body
      t.timestamps
    end
  end
end
