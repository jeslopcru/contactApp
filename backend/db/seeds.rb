def select_page
  page_list = %w[Home Blog News About Contact]
  page_list[rand(page_list.length)]
end

20.times do
  Contact.create(
      [
          {
              email: Faker::Internet.unique.email,
              first_name: Faker::Books::Dune.character,
              second_name: Faker::Books::Dune.character,
              phone: Faker::PhoneNumber.cell_phone_in_e164
          }
      ]
  )
end
