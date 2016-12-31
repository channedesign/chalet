class AddAttachmentChaletPictureToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :chalet_picture
    end
  end

  def self.down
    remove_attachment :pictures, :chalet_picture
  end
end
