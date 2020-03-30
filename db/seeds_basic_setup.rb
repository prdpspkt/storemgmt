# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#

@office = Office::Office.new
@office.gov ="प्रदेश सरकार"
@office.ministry ="भौतिक पूर्वाधार विकास मन्त्रालय"
@office.department = ""
@office.office = "खानेपानी तथा सरसफाई डिभिजन कार्यालय"
@office.address = "तनहुँ गण्डकी प्रदेश"
@office.user_id = 1
@office.has_project_access = true
@office.save

@user = User.new
@user.email = 'prdpspkt@gmail.com'
@user.password = '123456'
@user.is_admin = true
@user.name = "Pradeep Sapkota"
@user.office_id = @office.id
@user.save

@office.user_id = @user.id
@office.save

@fiscal_year = Office::FiscalYear.new
@fiscal_year.fy = "०७६/७७"
@fiscal_year.office_id = @office.id
@fiscal_year.save

@person1 = Office::Personnel.new
@person1.name_en = "Ramchandra Pandit"
@person1.name_ne = "रामचन्द्र पण्डित"
@person1.post = "Officer"
@person1.office_id = @office.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "6th Level Officer"
@person1.save


@person1 = Office::Personnel.new
@person1.name_en = "Hari Prasad Timilsina"
@person1.name_ne = "हरि प्रसाद तिमिल्सिना"
@person1.post = "कार्यालय प्रमुख"
@person1.office_id = @office.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "9th Level Officer"
@person1.save

@person1 = Office::Personnel.new
@person1.name_en = "Bamdev Paudel"
@person1.name_ne = "बामदेव पौडेल"
@person1.post = "इन्जिनियर"
@person1.office_id = @fiscal_year.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "8th Level Officer"
@person1.save


@store_body = Office::StoreBody.new
@store_body.office_id = @office.id
@store_body.fiscal_year_id = @fiscal_year.id
@store_body.office_chief_name = "हरि प्रसाद तिमिल्सिना"
@store_body.office_chief_degination = "डिभिजन प्रमुख"
@store_body.store_keeper_name = "रामचन्द्र पण्डित"
@store_body.office_chief_degination = "अधिकृत"
@store_body.save


@active_fiscal_year = Office::ActiveFiscalYear.new
@active_fiscal_year.fiscal_year_id = @fiscal_year.id
@active_fiscal_year.office_id = @office.id
@active_fiscal_year.save



Office::ItemCategory.create([{name_en: 'Stationary', unit_en: '', name_ne: 'स्टेसनरी', unit_ne: '', user_id: 1, office_id: 1},
                     {name_en: 'Furniture & Fixtures', unit_en: '', name_ne: 'फर्निचर तथा फिक्सर्स', unit_ne: '', user_id: 1, office_id: 1},
                     {name_en: 'Machines', unit_en: 'set', name_ne: 'मेशिनरी', unit_ne: 'सेट', user_id: 1, office_id: 1},
                     {name_en: "Vehicles", unit_en: "nos", name_ne: "सवारी साधन", unit_ne: "संख्या", office_id: 1, user_id: 1},
                     {name_en: 'Branded Desktop Computers', unit_en: 'set', name_ne: 'ब्रान्डेड डेस्कटप कम्प्युटर', unit_ne: 'सेट', user_id: 1, office_id: 1},
                     {name_en: 'Assembled Desktop Computers', unit_en: 'set', name_ne: 'एसेम्बल्ड डेस्कटप कम्प्युटर', unit_ne: 'सेट', user_id: 1, office_id: 1},
                     {name_en: 'Laptops', unit_en: 'set', name_ne: 'ल्यापटप', unit_ne: 'सेट', user_id: 1, office_id: 1},
                     {name_en: 'Computer Accesories', unit_en: 'pcs', name_ne: 'कम्प्युटरका परिपुरकहरू', unit_ne: 'गोटा', user_id: 1, office_id: 1},
                     {name_en: 'Misc', unit_en: '',name_ne: 'विविध', unit_ne: '', office_id: 1, user_id: 1}])

