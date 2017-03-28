# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Professional.destroy_all
Patient.destroy_all
Region.destroy_all
Speciality.destroy_all


speciality = Speciality.create(name: 'nutricionista')

other_speciality = Speciality.create(name: 'fisioterapeuta')

region = Region.create(name: 'zona sul')

other_region = Region.create(name: 'zona norte')

Professional.create([{ name: 'José', speciality: other_speciality, document: '413.555.321.77',
                                address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                region: other_region, password: '12345678' },
                      { name: 'Bruna', speciality: speciality, document: '422.555.321.77',
                                address: 'Rua numero um', neighborhood: 'Santa Cecília',
                                birthdate: '26/04/1992', genre: 'feminino', transport: 'carro',
                                perimeter: '10 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                photo: 'bruna.jpg', phone: '97475-3232', email: 'bruna@hotmail.com',
                                region: region, password: '123456' },
                      { name: 'Henrique', speciality: speciality, document: '411.555.321.77',
                                address: 'Rua numero tres', neighborhood: 'Santa Cecília',
                                birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                perimeter: '8 km', description: 'tenho 12 anos de experiencia na área',
                                photo: 'hrq.jpg', phone: '97475-3232', email: 'henriquepjv@hotmail.com',
                                region: region, password: '123456' }])

Patient.create([{photo: 'fotojpeg', name: 'Renan Guirado',
                                address: 'rua x apto 3, numero: 300', neighborhood: 'Ipiranga',
                                birthdate: '04/01/2001', genre: 'Masculino',
                                email: 'renan@peoplecare.com', password: 'xpt000000o', phone: '988759274',
                                speciality: other_speciality,
                                document: '07583849-0', profession: 'fisioterapeuta',
                                talk_to: 'Maria', phone_contact: '977639621', region: other_region },
                      { photo: 'fotojpeg', name: 'Edson',
                                address: 'rua z apto 10, numero: 300', neighborhood: 'pirituba',
                                birthdate: '04/01/2001', genre: 'Masculino',
                                email: 'edson@peoplecare.com', password: '123456', phone: '988759274',
                                speciality: speciality,
                                document: '07583849-0', profession: 'fisioterapeuta',
                                talk_to: 'Maria', phone_contact: '977639621', region: region },
                      { photo: 'fotojpeg', name: 'Aline',
                                address: 'rua tancredo', neighborhood: 'higienopolis',
                                birthdate: '04/01/2001', genre: 'Masculino',
                                email: 'aline@hotmail.com', password: '123456', phone: '988759274',
                                speciality: speciality,
                                document: '07583849-0', profession: 'fisioterapeuta',
                                talk_to: 'Maria', phone_contact: '977639621', region: region }])

p "Created #{Professional.count}, #{Patient.count}, #{Region.count} and #{Speciality.count}"
