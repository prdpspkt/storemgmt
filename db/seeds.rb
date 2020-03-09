# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#

@office = Office::Office.new
@office.gov ="Provincial Government"
@office.ministry ="Ministry of Physical Infrastructure Development"
@office.department = ""
@office.office = "Water Supply and Sanitation Divison Office"
@office.address = "Tanahu, Gandaki Pradesh"
@office.user_id = 1
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
@person1.post = "Office Chief"
@person1.office_id = @office.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "9th Level Officer"
@person1.save

@person1 = Office::Personnel.new
@person1.name_en = "Bamdev Paudel"
@person1.name_ne = "बामदेव पौडेल"
@person1.post = "Engineer"
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



Office::ItemCategory.create([{name_en: 'Stationary', unit_en: '', name_ne: 'स्टेसनरी', unit_ne: ''},
                     {name_en: 'Furniture & Fixtures', unit_en: '', name_ne: 'फर्निचर तथा फिक्सर्स', unit_ne: ''},
                     {name_en: 'Machines', unit_en: 'set', name_ne: 'मेशिनरी', unit_ne: 'सेट'},
                     {name_en: "Vehicles", unit_en: "nos", name_ne: "सवारी साधन", unit_ne: "संख्या"},
                     {name_en: 'Branded Desktop Computers', unit_en: 'set', name_ne: 'ब्रान्डेड डेस्कटप कम्प्युटर', unit_ne: 'सेट'},
                     {name_en: 'Assembled Desktop Computers', unit_en: 'set', name_ne: 'एसेम्बल्ड डेस्कटप कम्प्युटर', unit_ne: 'सेट'},
                     {name_en: 'Laptops', unit_en: 'set', name_ne: 'ल्यापटप', unit_ne: 'सेट'},
                     {name_en: 'Computer Accesories', unit_en: 'pcs', name_ne: 'कम्प्युटरका परिपुरकहरू', unit_ne: 'गोटा'},
                     {name_en: 'Misc', unit_en: '',name_ne: 'विविध', unit_ne: ''}])
Project::ItemCategory.create([{name_en: 'HDPE Pipes', unit_en: 'mtr', name_ne: 'एच. डी. पि. इ. पाइप', unit_ne: 'मि.'},
                     {name_en: 'HDPE Socket', unit_en: 'pcs', name_ne: 'एच. डि. पि. ई. सकेट', unit_ne: 'गोटा'},
                     {name_en: 'HDPE Reducers', unit_en: 'pcs', name_ne: 'एच. डी. पि. ई. रेड्युसर', unit_ne: 'गोटा'},
                     {name_en: 'HDPE Unions', unit_en: 'pcs', name_ne: 'एच. डी. पि. ई. युनियन', unit_ne: 'गोटा'},
                     {name_en: 'HDPE Tee', unit_en: 'pcs', name_ne: 'एच. डी. पि. ई. टि', unit_ne: 'गोटा'},
                     {name_en: 'HDPE Unequal Tee', unit_en: 'pcs', name_ne: 'एच. डी. पि. ई. अनइक्वायाल टि', unit_ne: 'गोटा'},
                     {name_en: 'HDPE-HDPE Flange Sets', unit_en: 'set', name_ne: 'एच. डी. पि. ई. - एच. डी. पि. ई. फ्लेंज सेट', unit_ne: 'सेट'},
                     {name_en: 'HDPE-HDPE Flange (OD) Sets', unit_en: 'set', name_ne: 'एच. डी. पि. ई. - एच. डी. पि. ई. फ्लेंज सेट (ओ.डी.)', unit_ne: 'सेट'},
                     {name_en: 'HDPE Elbow', unit_en: 'set' , name_ne: 'एच. डी. पि. ई. एल्बो', unit_ne: 'गोटा'},
                     {name_en: 'HDPE Cross Tees', unit_en: 'set', name_ne: 'एच. डी. पि. ई. क्रस टि', unit_ne: 'गोटा'},
                     {name_en: 'Gi Pipes', unit_en: 'mtr', name_ne: 'जि. आई पाइप', unit_ne: 'मिटर'},
                     {name_en: 'Gi Sockets', unit_en: 'pcs', name_ne: 'जि. आइ. सकेट', unit_ne: 'गोटा'},
                     {name_en: 'Gi Reducers', unit_en: 'pcs', name_ne: 'जि. आइ. रेड्युसर', unit_ne: 'गोटा'},
                     {name_en: 'Gi Unions', unit_en: 'pcs', name_ne: 'जि. आइ. युनियन', unit_ne: 'गोटा'},
                     {name_en: 'Brass Unions', unit_en: 'pcs', name_ne: 'ब्रास युनियन', unit_ne: 'गोटा'},
                     {name_en: 'Gi Tee', unit_en: 'pcs', name_ne: 'जि. आइ. टि', unit_ne: 'गोटा'},
                     {name_en: 'Gi Unequal Tee', unit_en: 'pcs', name_ne: 'जि. आइ. अनइक्वायाल टि', unit_ne: 'गोटा'},
                     {name_en: 'Gi Elbow', unit_en: 'pcs', name_ne: 'जि. आइ. एल्बो', unit_ne: 'गोटा'},
                     {name_en: 'Gi Cross Tee', unit_en: 'set', name_ne: 'जि. आइ. क्रस टि', unit_ne: 'गोटा'},
                     {name_en: 'Gi-Gi Flange Sets', unit_en: 'set', name_ne: 'जि. आइ.-जि.आइ. फ्लेन्ज सेट', unit_ne: 'सेट'},
                     {name_en: 'Gi-Gi Flange Sets (OD)', unit_en: 'set', name_ne: 'जि. आइ. - जि. आइ. फ्लेज सेट (ओडी)', unit_ne: 'सेट'},
                     {name_en: 'Gi-HDPE Flange Sets', unit_en: 'set', name_ne: 'जि. आइ.-एच. डी. पि. इ. फ्लेंज सेट', unit_ne: 'सेट'},
                     {name_en: 'Gi-HDPE Flange Sets (OD)', unit_en: 'set', name_ne: 'जि. आइ. सकेट', unit_ne: 'गोटा'},
                     {name_en: 'MS Casing Pipe', unit_en: 'pcs', name_ne: 'एम. एस. केसिङ्ग पाइप', unit_ne: 'गोटा'},
                     {name_en: 'MS Flange Sets', unit_en: 'set', name_ne: 'एम.एस. फ्लेंज सेट', unit_ne: 'सेट'},
                     {name_en: 'Gate Valves', unit_en: 'pcs', name_ne: 'गेट भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'GM Gate Valves', unit_en: 'pcs', name_ne: 'जि. एम. गेट भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Brass Gate Valves', unit_en: 'pcs', name_ne: 'ब्रास गेट भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Sulice Valves', unit_en: 'pcs', name_ne: 'सुलिस भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Butterfly Gate Valves', unit_en: 'pcs', name_ne: 'बटरफ्लाई गेट भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Air Valves', unit_en: 'pcs', name_ne: 'एयर भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Float Valves', unit_en: 'pcs', name_ne: 'फ्लोट भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Regulating Valves', unit_en: 'pcs', name_ne: 'रेगुलेटिङ्ग भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Regulating Keys', unit_en: 'pcs',  name_ne: 'रेगुलेटिङ्ग कि', unit_ne: 'गोटा'},
                     {name_en: 'Check Valves', unit_en: 'pcs', name_ne: 'चेक भल्ब', unit_ne: 'गोटा'},
                     {name_en: 'Water Pumps', unit_en: 'set', name_ne: 'वाटर पम्प', unit_ne: 'सेट'},
                     {name_en: 'Generators', unit_en: 'set', name_ne: 'जेनेरेटर', unit_ne: 'सेट'},
                     {name_en: 'Jack Machines', unit_en: 'set', name_ne: 'ज्याक मेसिन', unit_ne: 'सेट'},
                     {name_en: 'Wrench', unit_en: 'pcs', name_ne: 'रेन्च', unit_ne: 'गोटा'},
                     {name_en: 'Heating Plates', unit_en: 'pcs', name_ne: 'हिटीङ्ग प्लेट', unit_ne: 'गोटा'},
                     {name_en: 'Covers, Papers, Gaskets', unit_en: 'mtr', name_ne: 'कभर, पेपर, ग्यास्केट', unit_ne: 'मि.'},
                     {name_en: 'Pumplates, Flex, Books', unit_en: 'pcs', name_ne: 'पम्प्लेट, फ्लेक्स, बुक्स', unit_ne: 'गोटा'},
                     {name_en: 'Sanitation Items', unit_en: 'pcs', name_ne: 'सरसफाई सामाग्री', unit_ne: 'गोटा'},
                     {name_en: 'Construction Tools', unit_en: 'pcs', name_ne: 'निर्माण सामाग्री', unit_ne: 'गोटा'},
                    ])
Project::Item.create([{name_of_item_ne: "जेनेरेटर ६४ कि.वा.", name_of_item_en: "Generator 64 Kw", unit_ne: "सेट", unit_en: "set", item_category_id: 15}])
Office::Vendor.create([{fiscal_year_id: 1, office_id: 1, user_id:1, vendor_name_en: "Saraswati Stationery", vendor_name: "सरस्वती पुस्तक पसल", vendor_pan: "000000000", vendor_registration: "0000-000", vendor_address: "मालपोत लाइन दमौली", vendor_phone: "0000000000", vendor_email: "email@email.com.np", vendor_representive: "किशोर गौतम"}])