class CreateContactDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_details do |t|
      t.string :name
      t.string :email
      t.string :mobile_no
      t.string :message

      t.timestamps
    end
  end
end
