class Physician < ActiveRecord::Base
has_many :appointments
has_many :patants, :through => :appointments
end
