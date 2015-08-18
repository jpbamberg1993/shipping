class UserShipment < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipment
end
