RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.flash.error', text: message)
  end
end