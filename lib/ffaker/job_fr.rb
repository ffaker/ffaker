# => encoding utf-8
module Faker

	module JobFR

		extend ModuleUtils
		extend self



		JOB_PREFIXES   = k [
							'directeur', 'ordonnateur', 'responsable', 'administrateur', 'gestionnaire', 'assistant', 'chef',
							'conseiller', 'consultant', 'expert', 'conseiller technique', 'administrateur spécial',
							'directeur des opérations', 'intendant', 'superviseur'
						 ]

		JOB_ADJECTIVES = k ['', 'general', '', 'adjoint', '', 'associé', '']

		JOB_NOUNS      = k [
							'de la protection civile', 'de la division financiere', 'service comptable', 'agence comptable',
							'du service financier', 'des ressources humaines', 'de la recherche scientifique', 'des services informatiquues',
							'des services techniques', 'du management de la qualité', 'du patrimoine bati', 'du service commercial', 
							'du contrôle technique', 'contrôle qualité', ''
						  ]

		# => return a valid french job title
		def title			
      "#{JOB_PREFIXES.rand} #{JOB_ADJECTIVES.rand} #{JOB_NOUNS.rand}"
		end

	end

end