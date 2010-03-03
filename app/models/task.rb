class Task < ActiveRecord::Base

  def time_in_words
    hours = minutes / 60
    min = minutes % 60

    words = hours > 0 ? "#{hours} hours, " : ""
    words << "#{min} minutes"
    return words
  end
end
