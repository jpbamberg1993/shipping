class User < ActiveRecord::Base
  has_many :user_shipments
  has_many :shipments, through: :user_shipments

  def posted_shipments
    user_shipments.where(role: 'shipper').map(&:shipment)
  end

  def carrier_shipments
    user_shipments.where(role: 'carrier').map(&:shipment)
  end
end
