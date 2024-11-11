Rails.application.routes.draw do
  # Defines the routes for the Coupon API
  get 'getCoupon(/:code)', to: 'coupons#show', as: 'get_coupon'
  post 'createCoupon', to: 'coupons#create', as: 'create_coupon'
end
