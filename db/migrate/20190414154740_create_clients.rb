class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :username
      t.string :server
      t.string :contactname
      t.string :contactemail
      t.string :package
      t.string :source
      t.string :paidsam
      t.string :socialurl
      t.string :password
      t.float :price
      t.string :paidsam
      t.string :fbinstarepost
      t.string :closeio
      t.string :proxy
      t.date :datesold
      t.date :datestarted
      t.integer :startingfollowing
    end
  end
end
