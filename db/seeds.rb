AdminUser.create!(email: 'developers@platform45.com', password: 'password', password_confirmation: 'password')

Weighting.create(network: 'Facebook', field: 'like_count', value: 30)
Weighting.create(network: 'Facebook', field: 'share_count', value: 300)
Weighting.create(network: 'Twitter', field: 'count', value: 300)
Weighting.create(network: 'Laugh', field: 'entry', value: 50)
Weighting.create(network: 'Laugh', field: 'page_view', value: 10)
