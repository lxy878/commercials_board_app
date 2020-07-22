User.destroy_all
Commercial.destroy_all
Comment.destroy_all
State.destroy_all

u1 = User.create(username:'a', password:'a', email:'a@a.com', phone_number:'123-456-7890')
u2 = User.create(username:'b', password:'b', email:'b@b.com')
u3 = User.create(username:'c', password:'c', phone_number:'123-456-7890')
u4 = User.create(username:'d', password:'d')

