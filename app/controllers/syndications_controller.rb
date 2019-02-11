class SyndicationsController < ApplicationController
	before_action :set_body_content

	def show
		if @body_content
			render plain: @body_content
		else
			head 404, content_type: 'text/plain'
		end
	end

	protected

		def set_body_content
			@body_content ||= Syndication.get_content_from_route_kind("#{params[:id]}.#{params[:format]}")
		end
end