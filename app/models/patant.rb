class Patant < ActiveRecord::Base
has_many :appointments
has_many :physicians, :through => :appointments
end
