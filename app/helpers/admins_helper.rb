module AdminsHelper
  def active_tab?(i)
    'active' if i == 0
  end

  def column(num)
    12 / num
  end

  def side_bar_active(path)
    'side_bar_active' if request.path.include?(path)
  end

end
