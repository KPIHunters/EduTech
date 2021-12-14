class Lesson < ApplicationRecord
  # Dependencies
  acts_as_paranoid

  # Relations
  belongs_to :period

  # Validations
  validates :icon, length: { minimum: 5, maximum: 55 }, presence: false
  validates :name, length: { minimum: 5, maximum: 70 }, presence: true
  validates :video_id, length: { minimum: 5, maximum: 70 }, presence: true, on: :update
  validates_presence_of :period
  
  # Create video iframe URL
  def video_url 
    video_url = 'https://www.youtube.com/embed/'
    playlist_url = 'https://www.youtube.com/embed/videoseries?list'

    if !self.playlist_id.nil?
      self.playlist_id.index('http').nil? ? final_url = "#{playlist_url}=#{playlist_id}" : final_url = playlist_id  
    elsif !self.video_id.nil?
      self.video_id.index('http').nil? ? final_url = "#{video_url}/#{playlist_id}" : final_url = playlist_id
    else
      final_url = App::GENERIC_INTRO_URL
    end

    final_url
  end
end
