# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')  
  watch('test/test_helper.rb')
end

#guard 'rspec', :version => 2 do
#Set "guard 'rspec', :version => 2, :all_after_pass => false do" to ensure that Guard doesn’t run all the tests after a failing test passes (to speed up the Red-Green-Refactor cycle).
guard 'rspec', :version => 2, :all_after_pass => true, :cli => '--drb' do
  # Rails example
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb",
     "spec/requests/#{m[1]}_spec.rb"]
  end
  watch(%r{^app/views/(.+)/}) { |m| "spec/requests/#{m[1]}_spec.rb" }
  
  watch(%r{^app/(.+).rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+).rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')
  watch(%r{^spec/.+_spec\.rb$})
  watch('test/test_helper.rb')
end