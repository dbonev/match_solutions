class ProjectMailer < ActionMailer::Base
	default from: "contact@getqlibri.com"
	def welcome_email(project)
		@project = project
		@url  = 'http://getqlibri.com'
		mail(to: @project.email, subject: "#{@project.name}, thanks for submitting your project!")
	end
	def subcontractor_email(subcontractor)
		@subcontractor = subcontractor
		mail(to: @subcontractor.email, subject: "#{@subcontractor.name}, thanks for applying for a subcontractor!")
	end
end
