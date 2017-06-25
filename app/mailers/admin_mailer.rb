class AdminMailer < ApplicationMailer
  default from: 'no-reply@gdisd.com'

  def approve_applicant_email(name, email, about_you, how_you_found_us, why_volunteer)
    @name = name
    @email = email
    @about_you = about_you
    @how_you_found_us = how_you_found_us
    @why_volunteer = why_volunteer
    mail(to:'nainanalluri@gmail.com', subject:'GDI has received a new TA application')
  end
end
