# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'fc@armageddon', password: '201909')


# CD周りの初期データの記述
Genre.create!([
  {genre: 'ロック'},
  {genre: 'ポップス'},
  {genre: 'J-POP'},
  {genre: 'パンク'},
  {genre: 'ファンク'},
  {genre: 'ジャズ'}
])

Label.create!([
  {label: 'USMジャパン'},
  {label: 'Food'},
  {label: 'ソニー・ミュージックレコーズ'},
  {label: 'ユニバーサルミュージック'},
  {label: 'ワーナーミュージック・ジャパン'},
  {label: 'ワーナー・ブラザース・レコード'},
  {label: 'ビクターエンターテイメント'},
  {label: ' アップル・レコード'},
  {label: ' Freestyle Records'}
])

SalesStatus.create!([
    {sales_status: '販売中'},{sales_status: '販売停止中'}
])

Artist.create!([
  {artist: 'The Velvet Underground'},
  {artist: 'BLUR'},
  {artist: 'Aerosmith'},
  {artist: '［ALEXANDROS］'},
  {artist: 'MUSE'},
  {artist: 'Sex Pistols'},
  {artist: 'Nulbarich'},
  {artist: 'The Beatles'},
  {artist: 'FROOTFUL'}
])

# image:'';で囲んでてできんかった！


Cd.create!(
  [
    {
      genre_id: '1',
      label_id: '1',
      sales_status_id: '1',
      artist_id: '1',
      cd_name: 'ヴェルヴェット・アンダーグラウンド・アンド・ニコ',
      price: '2500',
      stock: '10'
    },
    {
      genre_id: '2',
      label_id: '2',
      sales_status_id: '1',
      artist_id: '2',
      cd_name: 'Think Tank',
      price: '1000',
      stock: '10'
    },
    {
      genre_id: '1',
      label_id: '3',
      sales_status_id: '1',
      artist_id: '3',
      cd_name: 'ミス・ア・シング',
      price: '1500',
      stock: '10'
    },
    {
      genre_id: '3',
      label_id: '4',
      sales_status_id: '1',
      artist_id: '4',
      cd_name: 'EXIST!',
      price: '2500',
      stock: '10'
    },
    {
      genre_id: '1',
      label_id: '5',
      sales_status_id: '1',
      artist_id: '5',
      cd_name: 'The Resistance',
      price: '1300',
      stock: '10'
    },
    {
      genre_id: '4',
      label_id: '6',
      sales_status_id: '1',
      artist_id: '6',
      cd_name: 'Never Mind the Bollocks Heres the Sex Pistols',
      price: '1300',
      stock: '10'
    },
    {
      genre_id: '5',
      label_id: '7',
      sales_status_id: '1',
      artist_id: '7',
      cd_name: 'VOICE',
      price: '1000',
      stock: '10'
    },
    {
      genre_id: '1',
      label_id: '8',
      sales_status_id: '1',
      artist_id: '8',
      cd_name: 'Abbey Road',
      price: '500',
      stock: '10'
    },
    {
      genre_id: '1',
      label_id: '6',
      sales_status_id: '1',
      artist_id: '9',
      cd_name: 'Heavyweight',
      price: '1500',
      stock: '10'
    }
  ]
)

# データ入れるの力尽きましたw

# Disc.create!(
#   [
#     {cd_id: '',
#      disc: '',
#      sort: '',
#     },
#   ]
# )

# Song.create!(
#   [
#     {disc_id: '',
#      song: '',
#      song_order: '',
#     },
#   ]
# )