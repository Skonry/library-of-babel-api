user1 = User.create(name: 'User1', email: 'user1@gmail.com', password: '123456')
user2 = User.create(name: 'User2', email: 'user2@gmail.com', password: '123456')

user1.shelves.create(name: 'Read')
user1.shelves.create(name: 'Currently reading')
user1.shelves.create(name: 'Want to read')

user2.shelves.create(name: 'Read')
user2.shelves.create(name: 'Currently reading')
user2.shelves.create(name: 'Want to read')

Book.create(
  title: 'The Hobbit, or There and Back Again', 
  author: 'J.R.R. Tolkien',
  cover: {io: Rails.root.join('app/assets/covers/hobbit.jpg').open, filename: 'hobbit.jpg'},
  rating: 8,
  description: 'The Hobbit, or There and Back Again is a children\'s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction. The book remains popular and is recognized as a classic in children\'s literature.'
)

Book.create(
  title: "Harry Potter and the Sorcerer's Stone", 
  author: 'J.K. Rowling',
  cover: {io: Rails.root.join('app/assets/covers/harry_potter.jpg').open, filename: 'harry_potter.jpg'},
  rating: 7,
  description: 'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry. Harry makes close friends and a few enemies during his first year at the school, and with the help of his friends, Harry faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry\'s parents, but failed to kill Harry when he was just 15 months old.'
)
Book.create(
  title: 'Ubik', 
  author: 'Philip K. Dick',
  cover: {io: Rails.root.join('app/assets/covers/ubik.jpg').open, filename: 'ubik.jpg'},
  rating: 10,
  description: 'Ubik is a 1969 science fiction novel by American writer Philip K. Dick. The story is set in a future 1992 where psychic powers are common and utilized in corporate espionage. It follows Joe Chip, a technician at a psychic agency who begins to experience strange alterations in reality that can be temporarily reversed by a mysterious store-bought substance called Ubik.'
)
Book.create(
  title: 'Do Androids Dream of Electric Sheep?', 
  author: 'Philip K. Dick',
  cover: {io: Rails.root.join('app/assets/covers/blade_runner.jpg').open, filename: 'blade_runner.jpg'},
  rating: 9,
  description: 'Do Androids Dream of Electric Sheep? (retitled Blade Runner: Do Androids Dream of Electric Sheep? in some later printings) is a science fiction novel by American writer Philip K. Dick, first published in 1968. The novel is set in a post-apocalyptic San Francisco, where Earth\'s life has been greatly damaged by a nuclear global war, leaving most animal species endangered or extinct. The main plot follows Rick Deckard, a bounty hunter who is tasked with "retiring" (i.e. killing) six escaped Nexus-6 model androids, while a secondary plot follows John Isidore, a man of sub-par IQ who aids the fugitive androids.'
)
Book.create(
  title: 'The Martian', 
  author: 'Andy Weir',
  cover: {io: Rails.root.join('app/assets/covers/marsjanin.jpg').open, filename: 'marsjanin.jpg'},
  rating: 8,
  description: 'The Martian is a 2011 science fiction novel written by Andy Weir. It was his debut novel under his own name. It was originally self-published in 2011; Crown Publishing purchased the rights and re-released it in 2014. The story follows an American astronaut, Mark Watney, as he becomes stranded alone on Mars in the year 2035 and must improvise in order to survive.'
)
Book.create(
  title: 'The Time Machine', 
  author: 'H.G. Wells',
  cover: {io: Rails.root.join('app/assets/covers/wehikul_czasu.jpg').open, filename: 'wehikul_czasu.jpg'},
  rating: 7,
  description: 'The Time Machine is a science fiction novella by H. G. Wells, published in 1895 and written as a frame narrative. The work is generally credited with the popularization of the concept of time travel by using a vehicle or device to travel purposely and selectively forward or backward through time. The term "time machine", coined by Wells, is now almost universally used to refer to such a vehicle or device.'
)
Book.create(
  title: '2001: A Space Odyssey', 
  author: 'Arthur C. Clarke',
  cover: {io: Rails.root.join('app/assets/covers/2001_odyseja_kosmiczna.jpg').open, filename: '2001_odyseja_kosmiczna.jpg'},
  rating: 7,
  description: '2001: A Space Odyssey is a 1968 epic science fiction film produced and directed by Stanley Kubrick. The screenplay was written by Kubrick and Arthur C. Clarke, and was inspired by Clarke\'s short story "The Sentinel" and other short stories by Clarke. A novelisation of the film released after the film\'s premiere was in part written concurrently with the screenplay. The film, which follows a voyage to Jupiter with the sentient computer HAL after the discovery of a featureless alien monolith affecting human evolution, deals with themes of existentialism, human evolution, technology, artificial intelligence, and the possibility of extraterrestrial life'
)

