class Places < ActiveRecord::Migration[5.2]
  def change
  	create_table :places do|t|
  		t.string :name
  		t.string :longt
  		t.string :latt
  	end
  	 
  end
end
