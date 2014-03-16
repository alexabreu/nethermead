class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name_upper
      t.string :name_proper

      t.timestamps
    end
  end
end
