class ProjectMailer < ActionMailer::Base
	default from: "from@example.com"
	def welcome_email(project)
		@project = project
		@url  = 'http://outsourcingheaven.com/login'
		mail(to: @project.email, subject: 'Welcome to My Awesome Site')
	end
end
