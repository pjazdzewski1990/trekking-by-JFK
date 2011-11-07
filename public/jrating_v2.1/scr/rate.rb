module FortunkaByJFK
	def rate = Rating.find_by_id(params[:'idBox'])
	rate.votes = rate.votes + 1
	rate.sum = rate.sum + params[:'rate'].to_f
	rate.save()
end