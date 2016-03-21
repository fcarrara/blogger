class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	belongs_to :author

	has_attached_file :image, styles: { medium: "500", thumb: "320" }, :convert_options => { :thumb => "-quality 75" }
	# has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" } # part of paperclip library
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	def tag_list
		tags.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect { |s| s.strip.downcase }.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end

	def increment_view_count
		self.view_count += 1
	end
end
