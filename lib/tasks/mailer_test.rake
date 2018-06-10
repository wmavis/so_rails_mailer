namespace :mailer_test do
  desc "Test delivering a mailer"
  task deliver: :environment do
    require 'ostruct'
    @user = OpenStruct.new({email: 'willard.mavis@gmail.com', name: 'Your Name', login: 'Your Login'})
    UserMailer.with(user: @user).welcome_email.deliver
  end

  desc "Test copying a mailer"
  task copy: :environment do
  end

end
