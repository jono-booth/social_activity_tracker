AdminUser.create!(email: 'developers@platform45.com', password: 'password', password_confirmation: 'password')

Weighting.create(network: 'Facebook', field: 'like_count', value: 1)
Weighting.create(network: 'Facebook', field: 'share_count', value: 2)
Weighting.create(network: 'Twitter', field: 'count', value: 1)
Weighting.create(network: 'Laugh', field: 'page_view', value: 1)
