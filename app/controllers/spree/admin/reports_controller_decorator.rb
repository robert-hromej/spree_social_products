Spree::Admin::ReportsController.class_eval do
  before_filter :advanced_reporting_setup, only: [:index]

  def social_products
      @products = Spree::Product.all
  end

  def advanced_reporting_setup
    Spree::Admin::ReportsController.add_available_report! :social_products
  end
end