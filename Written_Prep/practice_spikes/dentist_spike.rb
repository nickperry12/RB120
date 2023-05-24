### Dental Office Alumni (by Rona Hsu)

# There's a dental office called Dental People Inc.  Within this office, there's
# 2 oral surgeons, 2 orthodontists, 1 general dentist. Both general dentists and
# oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists
# straighten teeth. All of these aforementioned specialties are dentists. All
# dentists graduated from dental school.  Oral surgeons place implants. General
# dentists fill teeth

=begin
Extract nouns and verbs:

Nouns:
- Dentist
- Oral Surgeon
- Orthodontist
- General Dentist

Verbs
- Pull teeth
- Straighten teeth
- Place implants
- Fill teeth
- Graduated

Organize Verbs with Nouns

Pull teeth
- general dentist
- oral surgeon

Straighten teeth
- orthodontist

Graduated
- Oral Surgeon
- Orthodontist
- General Dentist

Place implants
- oral surgeon

Fill teeth
- general dentist

=end

module Pullable
  def pull_teeth; end
end

class DentalOffice
  def initialize(name)
    @name = name
    @dentists = [OralSurgeon.new,
      OralSurgeon.new,
      Orthodontist.new,
      GeneralDentist.new
    ]
  end
end

class Dentist
  def graduated; end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth; end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implants; end
end

class Orthodontist < Dentist
  def straighten_teeth; end
end