class ApplicantApprovedMailer < ApplicationMailer
  default from: 'no-reply@gdisd.com'

  def applicant_approved_notice_email(name, email)
    @name = name
    @email = email

    mail(to: @email, subject:'Girl Develop It San Diego has approved your application')
  end
end
