class Contact < MailForm::Base
	attribute :name, :validate => true
	attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message
	attribute :nickname, :captcha => true

	def headers
		{
			:subject => "DnDCharacterToolKit Contact Form",
			:to => ENV["ADMIN_EMAIL_ADDRESS"],
			:from => %("#{name}" <#{email}>")
		}
	end
end