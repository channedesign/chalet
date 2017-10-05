module HomeHelper
  def pricing_format(price)
    price == 'Booked' ? price : "€#{price}"
  end
  def pricing_format_fr(price)
    price == 'Booked' ? 'Réservé' : "€#{price}"
  end
end
