class Shipment < ActiveRecord::Base
  has_many :user_shipments
  has_many :users, through: :user_shipments

  def shippers
    user_shipments.where(role: 'shipper').map(&:user)
  end

  def carriers
    user_shipments.where(role: 'carrier').map(&:user)
  end
end
