class Idea < ActiveRecord::Base
    belongs_to :marketer
    has_many :likes, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :idea_verticals, dependent: :destroy
    has_many :verticals, through: :idea_verticals
    has_many :idea_solutions, dependent: :destroy
    has_many :solutions, through: :idea_solutions
    validates :marketer_id, presence: true  
    validates :name, presence: true, length: { minimum: 5, maximum: 100}
    validates :summary, presence: true, length: { minimum: 10, maximum: 150}
    validates :description, presence: true, length: { minimum: 20, maximum: 500 }
    mount_uploader :picture, PictureUploader
    validate :picture_size
    default_scope -> { order(updated_at: :desc) }
    
    def thumbs_up_total
     self.likes.where(like: true).size
    
    end
    
    def thumbs_down_total
      self.likes.where(like: false).size
    end  

    private
      def picture_size
          if picture.size > 5.megabytes
              errors.add(:picture, "should be less than 5MB")
          end
      end
end      