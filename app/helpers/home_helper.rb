module HomeHelper
  def pricing_format(price)
    price == '-' || price == 'Booked' ? price : "€#{price}"
  end
end
