feature "User profile" do
  scenario "can view a user's name and username on their profile page" do
    create_user
    visit("/users/profile/vannio")
    expect(page).to have_content("Van")
    expect(page).to have_content("vannio")
  end

  scenario "can view a user's peeps on their profile page" do
    Peep.create(
      text: "example peep",
      timestamp: Time.new(2001, 01, 01),
      user: create_user
    )

    visit("/users/profile/vannio")

    within find(".timeline") do
      expect(page).to have_content("example peep")
    end
  end

  scenario "non-existent users don't have profile page" do
    visit("/users/profile/vannio")
    expect(page).to have_content("User not found")
  end
end
