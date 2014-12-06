class ProjectMailer < ActionMailer::Base
	default from: "noreply@projectmatch.me"
	def welcome_email(project)
		@project = project
		@url  = 'http://www.projectmatch.me'
		mail(to: @project.email, subject: "#{@project.name}, thanks for submitting your project!", bcc: ["dimitar.bonev@gmail.com", "georgi.p.todorov@gmail.com"])
	end
	def subcontractor_email(subcontractor)
		@subcontractor = subcontractor
		mail(to: @subcontractor.email, subject: "#{@subcontractor.name}, thanks for applying for a contractor!", bcc: ["dimitar.bonev@gmail.com", "georgi.p.todorov@gmail.com"])
	end
end
