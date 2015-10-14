class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :email
      t.string :username
      t.string :full_name
      t.string :twitter_name
      t.string :github_name
      t.string :website_url
      t.integer :phone_number
      t.datetime :birth_date
      t.timestamps null: false
    end
  end
end
