require "rails_helper"

RSpec.describe InboundEmailsMailer, type: :mailer do
  describe "success" do
    let(:mail) { InboundEmailsMailer.success }

    it "renders the headers" do
      expect(mail.subject).to eq("Success")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
