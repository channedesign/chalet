module HomeHelper
  def pricing_format(price)
    price == '-' ? price : "€#{price}"
  end
end
