require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "admin mailer email" do
    let(:mail) {AdminMailer.approve_applicant_email('Lea Ann Bradford', 'leaann@notch8.com', 'Software dev at Notch8', 'meetup.com', 'I like to give back to the community')}

    it 'creates the email' do
      expect(mail.to).to eq(['nainanalluri@gmail.com'])
      expect(mail.subject).to eq('GDI has received a new TA application')
      expect(mail.from).to eq(['no-reply@gdisd.com'])
      expect(mail.body).to have_content('Lea Ann Bradford')
      expect(mail.body).to have_content('leaann@notch8.com')
      expect(mail.body).to have_content('Software dev at Notch8')
      expect(mail.body).to have_content('meetup.com')
      expect(mail.body).to have_content('I like to give back to the community')
    end
  end
end
