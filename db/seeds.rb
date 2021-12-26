# frozen_string_literal: true

require 'faker'

# Create Courses
web_dev = Course.create!(
  name: 'Web development for moms in 60 days',
  description: "Everyone’s talking about coding, but where do you start? One of the best ways is by building \
websites. Whether you want to tweak your business’s site, hone your web development skills, or learn to collaborate \
with developers, this will help you get there.",
  ask_question_url: 'https://app.slack.com/client/TP3DU1WRZ/G01CZERLTAT',
  what_students_learn: ['Read & Write HTML and CSS', 'Create your own design',
                        'Launch a website from your own computer', 'Build two live websites']
)

seo = Course.create!(
  name: 'SEO crash course for business owners',
  description: "Do you want to understand what it takes for search engines to like your website? Search Engine \
Optimization, or SEO, is a powerful way to drive targeted traffic to your website and help improve your search \
rankings. In this course you’ll learn SEO that you can immediately apply to your own website, with no prior \
experience required.",
  ask_question_url: 'https://app.slack.com/client/TP3DU1WRZ/CPH4NMW06',
  what_students_learn: ['SEO Strategies', 'Structure websites for SEO optimization', 'On-page & off-page SEO',
                        'Set up & use Google Analytics']
)

courses = [web_dev, seo]
courses_for_users = [[web_dev, seo], [web_dev], [seo]]

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
  courses: courses_for_users[0]
)

User.create!(
  first_name: 'Marie',
  last_name: 'Curie',
  email: 'marie@mltcstudents.com',
  password: 'HeyThere',
  courses: courses_for_users[1]
)

User.create!(
  first_name: 'J. D.',
  last_name: 'Salinger',
  email: 'jd@mltcstudents.com',
  password: 'HeyThere',
  courses: courses_for_users[2]
)

7.times do
  User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password,
    is_admin: false,
    courses: courses_for_users.sample
  )
end

# Create Topics

courses.each do |course|
  8.times do |i|
    Topic.create!(
      name: Faker::Fantasy::Tolkien.unique.poem,
      order: i + 1,
      course: course,
    )
  end
end

# Create Lessons
[web_dev, seo].each do |course|
  course.topics.each do |topic|
    6.times do |i|
      Lesson.create!(
        name: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
        description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
        order: i + 1,
        topic: topic
      )
    end
  end
end

# Create Materials
VideoMaterial.create!(body: 'https://mltcwebdev.s3-eu-west-1.amazonaws.com/web-dev-1/WD1_02_HTML_CSS_Intro', lesson: Lesson.first, order: 1)
PresentationMaterial.create!(body: 'https://docs.google.com/presentation/d/e/2PACX-1vQaWCQsDtdh-Ab-EMlvuMY0ZHpiI95xzk8UQTmaumh-1DgHARQ2TkojgdFYLKqqeDSLhHPVwut6umrY', lesson: Lesson.first, order: 2)
TextMaterial.create!(body: '<h2>Hi I am your material body</h2><p>Show me</p>', lesson: Lesson.first, order: 3)
ResourceMaterial.create!(body: '<p><a href="https://seionline.ch" target="_blank">Sei Online link</a></p>', lesson: Lesson.first, order: 4)
TaskMaterial.create!(body: '<ul><li>Do this</li><li>And this</li><li>And this too</li></ul>', lesson: Lesson.first, order: 5)
