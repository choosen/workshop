class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    cn = subject_item.subject_item_notes.count
    if cn.nil? || cn == 0
      return "0.00"
    else
      sum = subject_item.subject_item_notes.sum(:value)
      return '%.2f' % (sum / cn.to_f)
    end
  end
end
