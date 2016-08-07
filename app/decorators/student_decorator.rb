class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    cn = Student.find(id).subject_item_notes.where(:subject_item_id => subject_item.id ).map(&:value)
    return "0.00" if cn.blank?
    sum = 0.0
    cn.each { |e| sum += e }
    return '%.2f' % (sum / cn.length.to_f)
  end
end
