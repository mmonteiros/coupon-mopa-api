class CouponsController < ApplicationController
  # GET /getCoupon/:code
  def show
    if !params[:code].present?
      render json: {
        coupon: {
          code: 'MOPA25',
          discount: 25
        }
      }, status: :ok
    else
      coupon = Coupon.find_by(code: params[:code])
      if coupon
        render json: {
          coupon: {
            code: coupon.code,
            discount: coupon.discount.to_f
          }
        }, status: :ok
      else
        render json: { error: "Coupon not found" }, status: :not_found
      end
    end
  end

  # POST /createCoupon
  def create
    coupon = Coupon.new(coupon_params)
    if coupon.save
      render json: { coupon: coupon }, status: :created
    else
      render json: { errors: coupon.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code, :discount)
  end
end
