guard 'passenger', :cli => '--port 3000' do
  watch('.powrc')
  watch('.powenv')
  watch('.rvmrc')
  watch(%r{^app/.*\.rb$})
  watch('app.rb')
  watch(%r{^config/.*\.rb$})
  watch('config.ru')
  watch('Gemfile')
  watch('Gemfile.lock')
end
