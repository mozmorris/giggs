require 'thor'

shell = Thor::Base.shell.new

email     = shell.ask "Which email do you want use for logging into admin?"
password  = shell.ask "Tell me the password to use:", :echo => false

shell.say ""

account = User.create(
            :email    => email,
            :password => password
          )

if account.valid?
  shell.say "================================================================="
  shell.say "User has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{'*' * password.length}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

page =  Page.create(
          :h1      => 'Welcome to Giggs.',
          :content => 'This is our first test page.'
        )

if page.valid?
  shell.say "================================================================="
  shell.say "The first page has been successfully created"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  page.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""
