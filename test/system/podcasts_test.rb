require 'application_system_test_case'

class PodcastsTest < ApplicationSystemTestCase
  setup do
    @podcast = podcasts(:one)
  end

  test 'visiting the index' do
    visit podcasts_url
    assert_selector 'h1', text: 'Podcasts'
  end

  test 'should create podcast' do
    visit podcasts_url
    click_on 'New podcast'

    fill_in 'Description', with: @podcast.description
    fill_in 'Name', with: @podcast.name
    click_on 'Create Podcast'

    assert_text 'Podcast was successfully created'
    click_on 'Back'
  end

  test 'should update Podcast' do
    visit podcast_url(@podcast)
    click_on 'Edit this podcast', match: :first

    fill_in 'Description', with: @podcast.description
    fill_in 'Name', with: @podcast.name
    click_on 'Update Podcast'

    assert_text 'Podcast was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Podcast' do
    visit podcast_url(@podcast)
    click_on 'Destroy this podcast', match: :first

    assert_text 'Podcast was successfully destroyed'
  end
end
