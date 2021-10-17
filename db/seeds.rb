# frozen_string_literal: true

require 'faker'

# Create Courses
web_dev = Course.create!(
  name: 'Web develompent for moms in 50 days',
  description: "Everyone’s talking about coding, but where do you start? One of the best ways is by building \
websites. Whether you want to tweak your business’s site, hone your web development skills, or learn to collaborate \
with developers, this will help you get there.",
  what_students_learn: ['Read & Write HTML and CSS', 'Create your own design',
                        'Launch a website from your own computer', 'Build two live websites']
)

seo = Course.create!(
  name: 'SEO crash course for business owners',
  description: "Do you want to understand what it takes for search engines to like your website? Search Engine \
Optimization, or SEO, is a powerful way to drive targeted traffic to your website and help improve your search \
rankings. In this course you’ll learn SEO that you can immediately apply to your own website, with no prior \
experience required.",
  what_students_learn: ['SEO Strategies', 'Structure websites for SEO optimization', 'On-page & off-page SEO',
                        'Set up & use Google Analytics']
)

courses = [[web_dev, seo], [web_dev], [seo]]

# Creates an admin user
User.create!(
  first_name: 'Hana',
  last_name: 'Harencarova',
  email: 'h.harencarova@gmail.com',
  password: 'setSomePasswordHere',
  is_admin: true
)

# Create Users
User.create!(
  first_name: 'Anne-France',
  last_name: 'Dautheville',
  email: 'ann@mltcstudents.com',
  password: 'HeyThere',
  courses: courses[0]
)

User.create!(
  first_name: 'Marie',
  last_name: 'Curie',
  email: 'marie@mltcstudents.com',
  password: 'HeyThere',
  courses: courses[1]
)

User.create!(
  first_name: 'J. D.',
  last_name: 'Salinger',
  email: 'jd@mltcstudents.com',
  password: 'HeyThere',
  courses: courses[2]
)

7.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    is_admin: false,
    courses: courses.sample
  )
end

# Create Topics
i = 0
20.times do
  Topic.create!(
    name: Faker::Fantasy::Tolkien.poem,
    order: i += 1,
    course: Course.all.sample
  )
end
