# == Schema Information
#
# Table name: syndications
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Syndication < ActiveRecord::Base
	def self.get_content_from_route_kind(route_kind)
		where.not(body: 'Old Feed').order(created_at: :desc).find_by(name: route_kind).try(:body)
	end
end
