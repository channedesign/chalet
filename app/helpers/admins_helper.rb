module AdminsHelper
  def active_tab?(i)
    'active' if i == 0
  end

  def column(num)
    12 / num
  end
end
