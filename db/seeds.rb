# frozen_string_literal: true

Category.create([
  { name: 'Ruby' },
  { name: 'JavaScript' },
  { name: 'Go'        },
  { name: 'Python'    },
  { name: '.NET'      }
]
               )

User.create([
  { email: 'one@example.com' },
  { password: 'password' }
]
           )
