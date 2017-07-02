# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class ApplicantApprovedMailerPreview < ActionMailer::Preview
  def applicant_approved_notice_email
    ApplicantApprovedMailer.applicant_approved_notice_email('Lea Ann Bradford', 'test@testemail.com')
  end
end
