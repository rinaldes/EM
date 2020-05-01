class Api::V1::ProgrammesController < Api::V1::BaseController
  def show
    programme = Programme.find(params[:id])
    if programme.present?
      # expose programme, :include => [{:session_feedbacks => {:include => :session_feedback_options}}]
      expose programme, serializer: ProgrammeSerializer
    else
      expose error! :not_found
    end
  end
end
