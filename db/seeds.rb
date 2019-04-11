
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.lyon-france.com/Je-decouvre-Lyon/activites-loisirs-et-bien-etre/Parcs-jardins-et-lieux-de-balade"))
   @tab_url = []
@tab_title = []
@tab_description = []

doc.css('.header-text-one a @title').each do |elem| @tab_title << elem.text end
doc.css('.list_offres .card-list-horizontal-content .col-xs-12 a img @src').each do |elem| @tab_url << elem.text end
doc.css('.list_offres .card-list-horizontal-content .col-xs-12 .description').each do |elem| @tab_description << elem.text end

    @tab_latitude = [45.777411, 45.782929, 45.773373, 45.775568, 49.252947, 45.780971, 45.798634, 45.741780, 45.762819, 45.721260, 45.785825]
@tab_longitude = [4.855225, 4.852306, 4.854822, 4.858500, 4.030319, 4.832410, 4.940681, 4.808979, 4.823683, 4.828134, 4.730715]

10.times do |y|
    @places = Place.create(name: @tab_title[y], description: @tab_description[y], image_url: @tab_url[y], latitude: @tab_latitude[y], longitude: @tab_longitude[y])
end

doc = Nokogiri::HTML(open("https://wall.alphacoders.com/search.php?lang=French&search=forest"))
    @taburl = []
    @tabtitle = ["foret dorée","foret","une foret","foret gris","foret de la vega","foret petit","foret saute","foret pour THP","foret sombre","foret rose","foret","foret jolie","foret azerty","foret rouge","foret lyon","foret agitée","star wars","foret film","foret","foret final"]
    myhash = {}
    20.times do
        doc.css('.boxgrid img @src').each do |url| @taburl << url.text end
    end

    20.times do |y|
        @items = Item.create(title:@tabtitle[y], description:Faker::Lorem.paragraph, price:rand(1.00...10), image_url:@taburl[y])
    end

