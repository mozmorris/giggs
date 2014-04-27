require 'thor'

shell = Thor::Base.shell.new

email     = shell.ask "Which email do you want use for logging into admin?"
password  = shell.ask "Tell me the password to use:"

shell.say ""

account = User.create(
            :email    => email,
            :name     => "Admin",
            :password => password
          )

if account.valid?
  shell.say "================================================================="
  shell.say "User has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{password}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

page =  Page.create(
          :h1    => 'Welcome to Giggs',
          :h2    => 'This is a sample page to get you started.',
          :intro => '<a href="/login">Sign in</a> to edit this page.'
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
