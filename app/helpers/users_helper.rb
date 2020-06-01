module UsersHelper
  def calories(age, gender, height, weight, activity)
    factor = activity_case(activity)
    bmr = if gender == 'Female'
            655 + 4.35 * weight + 4.7 * height - 4.7 * age
          else
            66 + 6.23 * weight + 12.7 * height - 6.8 * age
          end
    (bmr * factor).to_i
  end

  def activity_case(activity)
    case activity
    when 'Sedentary'
      1.2
    when 'Lightly active'
      1.375
    when 'Moderately active'
      1.55
    when 'Very active'
      1.725
    when 'Extra active'
      1.9
    end
  end
end
