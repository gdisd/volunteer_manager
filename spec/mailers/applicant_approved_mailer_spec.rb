require "rails_helper"

RSpec.describe ApplicantApprovedMailer, type: :mailer do
  describe "applicant is notified they have been approved email" do
    let(:mail) {ApplicantApprovedMailer.applicant_approved_notice_email('Lea Ann Bradford', 'test@testemail.com')}

    it 'creates the email' do
      expect(mail.to).to eq(['test@testemail.com'])
      expect(mail.subject).to eq('Girl Develop It San Diego has approved your application')
      expect(mail.from).to eq(['no-reply@gdisd.com'])
      expect(mail.body).to have_content('Thank you Lea Ann Bradford for volunteering for Girl Develop It San Diego.')
      expect(mail.body).to have_content('Your application for GDI Teaching Assistant has been approved. A list of events that you can volunteer for is now available on your dashboard.')
    end
  end
end
