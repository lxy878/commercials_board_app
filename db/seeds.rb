User.destroy_all
Commercial.destroy_all
Comment.destroy_all
State.destroy_all

u1 = User.create(username:'a', password:'a', email:'a@a.com', phone_number:'123-456-7890')
u2 = User.create(username:'b', password:'b', email:'b@b.com')
u3 = User.create(username:'c', password:'c', phone_number:'123-456-7890')
u4 = User.create(username:'d', password:'d')

ny = State.create(name: 'New York')
ca = State.create(name: 'California')
fl = State.create(name: 'Florida')
nj = State.create(name: 'New Jersey')
nc = State.create(name: 'North Carolina')
sc = State.create(name: 'South Carolina')

u1.commercials.create(title: 'GET A GUARANTEED PRICE FOR YOUR MOVE WITHIN MINUTES', description: 'Moving size, distance and providing customized moving service. Receive quotation, reservation, and pay By Cash. Local moving, Commercial moving, Household moving, Office moving, Piano moving', state: ny)
u1.commercials.create(title: 'Drain cleaning & plumbing', description: "Pro Rooter plumbing professionals are available 24/7 to perform routine drain maintenance, emergency drain cleaning services and sewer cleaning. Our drain cleaning services include floor drains, downspout drains, storm drains, sewer drains, and more. As a premier drain cleaning company, Pro-Rooter is leading the industry by cleaning more drains and performing more sewer line repairs than any other company in North America. Pro Rooter can help with any kind of clogged drain and address all sewer cleaning services. Our plumbers provide both residential and commercial services, addressing clogged kitchen drains, clogged bathroom drains, clogged outdoor drains, and clogged sewer lines 24 hours a day, 7 days a week", state: fl)
u4.commercials.create(title: 'Curb It App! Junk Removal - Hauling - Garbage - Trash -Best Prices!', description: "Fast, easy and safe way to get rid of junk, trash, debris, garbage, rubbish and more at competitive hassle-free prices. Get bids and request a job in minutes by downloading our mobile app, by using our web app at www.Curb-It.com, or give us a call. We hear you. The COVID 19 virus is affecting us in many different ways. Our hauler network has been informed about CDC guidelines, Social Distancing guidelines and our App allows customers to get rid of their junk without any personal contact. Leave your junk outside and our haulers will come by and grab it. The App is simple. Just snap a few photos of the items you want gone. In minutes you'll receive multiple bids from background checked and insured Haulers. Award the job to the Hauler of your choosing who arrives on demand or at a scheduled day and time of your choice. REQUEST A QUOTE VIA EMAIL BY REPLYING TO THIS AD, PLEASE PROVIDE YOUR ADDRESS & PHONE NUMBER ALONG WITH PICTURES OF ALL ITEMS TO BE REMOVED.", state: ca)
u2.commercials.create(title: 'Lost car keys Locksmith Replacement Car keys Car Locksmith near me', description: "Our residential and commercial locksmith services are available in the Greater New York City (NYC) area and include lock rekeying, lock replacement and installation, emergency lockouts, master key systems, and much more! We specialize in key replacement services for all types of vehicles, including common makes such as Ford, Chevy, and Honda, as well as luxury cars like BMW and Mercedes Benz. We provide standard keys, smart keys, or keyless entry remotes, and transponders.", state: nc)
u3.commercials.create(title: 'TAKING AN ONLINE SUMMER CLASS? IVY LEAGUE TUTOR HERE TO HELP', description: "My name is Phil and I am a recent graduate of Cornell University's Engineering program. I tutor on the side of my corporate job for a side income and really enjoy helping my students succeed in their classes. I am flexible and get you the grade YOU want.", state: nj)
u3.commercials.create(title: 'Business Writers for Hire', description: "Need business writing done, but don’t know where to turn? With so many options out there, it can be hard to pick a reputable service, but we are here for you! Even your most trying writing projects are no match for our extensive knowledge and years of experience. As an independent company, we understand the value of repeat customers, and as such, we aim to please. Our prices are decent and the work is undertaken promptly. Send us an email today so that we can start working for you. We are sure you will be pleased with our service.", state: sc)