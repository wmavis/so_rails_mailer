require 'ostruct'

namespace :mailer_test do
  desc "Test delivering a mailer"
  task deliver: :environment do
    @user = OpenStruct.new({email: 'original@example.com', name: 'Your Name', login: 'Your Login'})
    UserMailer.with(user: @user).welcome_email.deliver
  end

  desc "Test copying a mailer"
  task copy: :environment do
    @user = OpenStruct.new({email: 'original@example.com', name: 'Your Name', login: 'Your Login'})
    mailer = UserMailer.with(user: @user).welcome_email
    mailer_copy = mailer.clone
    mailer_copy.to = "new_email@example.com"
    mailer_copy.subject = "New subject"
    puts "ORIGINAL:"
    puts mailer.to
    puts mailer.subject
    puts "COPY:"
    puts mailer_copy.to
    puts mailer_copy.subject
  end

end
