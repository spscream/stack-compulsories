class Compulsory < ActiveRecord::Base
    validates :code, presence: true
    validates :name, presence: true
    validates :image, presence: true

    mount_uploader :image, ImageUploader
end
