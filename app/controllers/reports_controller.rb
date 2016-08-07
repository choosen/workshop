class ReportsController < ApplicationController
  before_action :authenticate_user!
  #expose(:subject_items) { SubjectItem.not_assigned_or_assigned_to_teacher(teacher_params) }
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:subject_item)

  private
  #
  # def teacher_params
  #   begin
  #     params.require(:teacher).permit(:teacher_id)
  #   rescue #ApplicationController::ParameterMissing
  #     teacher = Teacher.new
  #     params.merge({teacher: teacher})
  #   end
  # end
end
