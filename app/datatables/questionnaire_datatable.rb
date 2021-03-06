class QuestionnaireDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_manage_questionnaire_path, :manage_questionnaire_path

  def sortable_columns
    @sortable_columns ||= [
      false,
      'questionnaires.id',
      'questionnaires.first_name',
      'questionnaires.last_name',
      'users.email',
      'questionnaires.international',
      'questionnaires.state',
      'questionnaires.year',
      'questionnaires.experience',
      'questionnaires.interest',
      'schools.name'
    ]
  end

  def searchable_columns
    @searchable_columns ||= [
      'questionnaires.id',
      'questionnaires.first_name',
      'questionnaires.last_name',
      'users.email',
      'questionnaires.state',
      'schools.name'
    ]
  end

  private

  def data
    records.map do |record|
      [
        link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_manage_questionnaire_path(record)),
        record.id,
        record.first_name,
        record.last_name,
        record.email,
        record.international,
        record.state,
        record.year,
        record.experience,
        record.interest,
        record.school.name
      ]
    end
  end

  def get_raw_records
    Questionnaire.includes(:user, :school)
  end
end
