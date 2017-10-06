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

  def check_floor_plan_count(floor_plans)
    if floor_plans.size == 3
      'col-sm-4'
    elsif floor_plans.size == 2
      'col-sm-6'
    else
      'col-sm-12'
    end
  end

end
