module ApplicationHelper
  def chalet_email(num = nil)
    "mailto:chaletshideaway@gmail.com?subject=Chalets Hideaway #{num}"
  end

  def month_text
    ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    # {
    #   '1': 'Jan',
    #   '2': 'Feb',
    #   '3': 'Mar',
    #   '4': 'Apr',
    #   '5': 'May',
    #   '6': 'Jun',
    #   '7': 'Jul',
    #   '8': 'Aug',
    #   '9': 'Sep',
    #   '10': 'Oct',
    #   '11': 'Nov',
    #   '12': 'Dec'
    # }
  end

end
