require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Submit" }.should_not change(Micropost, :count)
      end

      describe "error messages" do
        let(:error) { '1 error prohibited this micropost from being saved' }
        before { click_button "Submit" }
        it { should have_content(error) } 
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Submit" }.should change(Micropost, :count).by(1)
      end
    end
  end
	
	describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.should change(Micropost, :count).by(-1)
      end
    end
		
		describe "as incorrect user" do
			let!(:incorrect_user) { FactoryGirl.create(:user, name: "incorrect", email: "incorrect@test.com", password: "wrong_user") }
      before { get user_path(incorrect_user) }

      it { should_not have_selector('td', text: "delete") }
    end
  end
	
	describe "micropost count" do
		before {visit root_path}
		
		context "when one micropost" do
			it { should have_selector('span.microposts', text: "#{user.microposts.limit(1).count} micropost") }
		end
		
		context "when more than one microposts" do
			it { should have_selector('span.microposts', text: "#{user.microposts.count} microposts") }
		end
				
		context "when zero microposts" do
			it { should have_selector('span.microposts', text: "#{user.microposts.limit(0).count} microposts") }
		end
	end
	
	describe "pagination" do
		before(:all) do 
			visit root_path
			60.times { FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum") }
		end
		
		after(:all)  { user.microposts.delete_all }
		
		let(:first_page)  { user.microposts.paginate(page: 1) }
    let(:second_page) { user.microposts.paginate(page: 2) } 
		
		it { should have_link('Next') }
		it { should have_link('2') }
		
		it "should list the first page of microposts" do
			first_page.each do |micropost|
				page.should have_selector('span.content', text: micropost.content)
			end
		end
		
		it "should list the second page of microposts" do
			second_page.each do |micropost|
				page.should have_selector('span.content', text: micropost.content)
			end
		end		
	end
end