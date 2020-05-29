module UsersHelper
  def calories(age, gender, height, weight, activity)
    case activity
    when 'Sedentary'
      factor = 1.2
    when 'Lightly active'
      factor = 1.375
    when 'Moderately active'
      factor = 1.55
    when 'Very active'
      factor = 1.725
    when 'Extra active'
      factor = 1.9
    end
    if gender == "Female"
      bmr = 655 + 4.35 * weight + 4.7 * height - 4.7 * age
    else
      bmr = 66 + 6.23 * weight + 12.7 * height - 6.8 * age
    end
    return (bmr * factor).to_i
  end
end
