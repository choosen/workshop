puts "Seeds: start"

SubjectItemNote.delete_all
SubjectItem.delete_all
Participation.delete_all
Teacher.delete_all
Student.delete_all
User.delete_all


TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

Teacher.create!(
  first_name: 'Adam',
  last_name: 'Nowak',
  academic_title: TEACHER_TITLES.sample
)

Teacher.create!(
  first_name: 'Piotr',
  last_name: 'Wasiak',
  academic_title: TEACHER_TITLES.sample
)

Teacher.create!(
  first_name: 'Łukasz',
  last_name: 'Kruk',
  academic_title: TEACHER_TITLES.sample
)

teachers = Teacher.all
subjects = %w{Math Polish Greek History Sport}

subjects.each do |s|
  SubjectItem.create!(
    title: s,
    teacher: teachers.sample
  )
end

names = %w{Adam|Barcik Mateusz|Komar Konrad|Mateusz Ewelina|Pipczynska
          Kludia|Kowalska Adam|Nawałka Robert|Lewandowski Jan|Trevor
          Jan|Wężyk Tadeusz|Zimoch Barbara|Kara Czesław|Miłosz
          Adam|Kurtyka Mateusz|Mucha Anna|Mucha Karolina|Strzelec
          Karina|Słaba Anna|Zgrabna Romuald|Traugut Stefan|Batory
          Jan|Kazimierz Sebastian|Bach Norbert|Grześ Lech|Wałęsa
          Roman|Duch}
names.each do |s|
  Student.create!(
    first_name: s.split('|')[0],
    last_name: s.split('|')[1]
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
