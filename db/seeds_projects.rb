  Roo::Excelx.new("#{Rails.root}/db/data/projects.xlsx")
  header = spreadsheet.row(1)
  projects = (2..spreadsheet.last_row).map do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    project = Project::Project.find_by_id(row["id"]) || Project::Project.new
    begin
      project.attributes = row.to_hash
    rescue Exception => error
     puts error.message
    end
    project.office_id = @office.id
    project.user_id = @user.id
    if project.valid?
      project.save!
    end
  end
