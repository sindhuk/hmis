class Testmaster < ActiveRecord::Base
      validates_presence_of  :test_code, :test_name, :fee
end
