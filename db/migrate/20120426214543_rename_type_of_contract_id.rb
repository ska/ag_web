class RenameTypeOfContractId < ActiveRecord::Migration
  def self.up
    rename_column :houses, :id_TypeOfContract, :TypeOfContract_id
  end

  def self.down
    rename_column :houses, :TypeOfContract_id, :id_TypeOfContract
    
  end
end
