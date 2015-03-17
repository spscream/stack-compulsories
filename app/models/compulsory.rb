class Compulsory < ActiveRecord::Base
    validates :code, presence: true
    validates :name, presence: true
end
