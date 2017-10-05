module ApplicationHelper
  def chalet_email(num = nil)
    "mailto:chaletshideaway@gmail.com?subject=Chalets Hideaway #{num}"
  end

  def month_text
    ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  end

  def month_text_fr
    ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Jui', 'Août', 'Sep', 'Oct', 'Nov', 'Dec']
  end

  def check_floor_plan_count(house)
    if house.floor_plan_count == 3
      'col-sm-4'
    elsif house.floor_plan_count == 2
      'col-sm-6'
    else
      'col-sm-12'
    end
  end

end
