# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def approve_applicant_email
    AdminMailer.approve_applicant_email('Lea Ann Bradford', 'leaann@notch8.com', 'Software dev at Notch8', 'meetup.com', 'I like to give back to the community')
  end
end
