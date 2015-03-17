class Compulsory < ActiveRecord::Base
    enum discipline: [:di, :dp, :dt, :mi, :mp, :mt]

    validates :code, presence: true
    validates :name, presence: true
    validates :image, presence: true
    validates :discipline, presence: true, allow_nil: false

    mount_uploader :image, ImageUploader

end
