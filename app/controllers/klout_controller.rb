class KloutController < ApplicationController

	def show
		@id = Klout.get_id(params[:id])
		@score = Klout.get_score(@id)
		@topics = Klout.get_topics(@id)
	end

	

end
