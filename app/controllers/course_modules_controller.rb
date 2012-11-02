class CourseModulesController < InheritedResources::Base

  def update
    update! do |success, failure|
      failure.html {
        flash[:notice] = "Error updating module"
      }
      success.html { redirect_to course_modules_path }
    end
  end

end
