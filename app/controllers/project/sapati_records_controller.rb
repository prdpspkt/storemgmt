class Project::SapatiRecordsController < ProjectController

  def index
    @sapati_records = current(Project::SapatiRecord)
  end
end
