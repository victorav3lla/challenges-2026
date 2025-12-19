## AI Week - Kick-off

You will spend the next sessions with your Project Group working on an AI Assistant for a **User** with a **Goal**. For instance, Wott is an AI Assistant for **students learning how to code**. You'll want to think about the "persona" of your core user ("student learning how to code") and their goal ("I'm stuck on a problem and want the AI to solve it for me"). This will help you define the scope of your app.

Brainstorm with your group and create a ticket to validate your idea with a teacher.

### Demos

You will demo your work (in production, no demos on `localhost`!) during the **Multi-modal inference** and **Tools & Agents** sessions. Deadlines matter!

### Part I

Work on the following steps and validate them with a teacher at the start of the session before creating your Rails app and moving on to Part II. You will save a lot of time by doing this, trust us.

#### 1 - User stories

Duplicate this [spreadsheet](https://docs.google.com/spreadsheets/d/1Kh4r-r5ZDyaWSfJdvW1NQJEfqt-wO3ExFR9SVp29lpY/edit?gid=0#gid=0) (1 per team) and invite your teammates to collaborate.

![duplicate](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/duplicate.png)
![rename](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/rename.png)

Start by thinking of the **user journeys** you will showcase during the demo. There are lots of possible use cases for an AI Assistant, but try to narrow them down to the minimum viable journeys to solve a specific problem.

<details><summary markdown='span'>View solution
</summary>

- 1 user journey for the user navigating in challenges (or the context of your choice)
- 1 user journey for the user adding new challenges
- 1 user journey for the user editing or destroying challenges they have created
- 1 user journey for the user chatting w/ the AI about one challenge (or the context of your choice)
</details>

Each user journey contains several **user stories**: write them down in the spreadsheet by using the right terminology. When you are done, create a ticket to validate them with a teacher.

You can draw quick sketches with a pen and paper of the different screens and the rough elements they contain. This will help you visualize your user journeys. Be careful, no need to be too specific at this point! This is a sprint, you need to allocate your time and resources wisely.

<details><summary markdown='span'>View solution
</summary>
- As a visitor, I can visit the home page to see the application's proposition value
- As a visitor, I can see the list of challenges to navigate to the challenge I would like to take
- As a visitor, I can click on a challenge to see its details
- As a user, I can display a form to fill in the information required to create a new challenge
- As a user, I can submit the form to create the new challenge
- As a user, I can display a form to edit a challenge I have created
- As a user, I can submit the form to update the challenge
- As a user, I can destroy a challenge I have created
- As a user, I can create a chat w/ the AI Assistant about one challenge
- As a user, I can see the list of chats I created w/ the AI Assistant about one challenge
- As a user, I can navigate to a chat I created w/ the AI Assistant about one challenge
- As a user, I can send a message to the AI Assistant in the context of a chat
- As a user, I can send a message w/ a file attachement to the AI Assistant
- As a user, I can send a follow-up message to the AI Assistant
</details>

#### 2 - Database Schema

Draw your database schema using [our db tool](https://kitt.lewagon.com/db/new) and **create a ticket to validate it with a teacher**. Draw only the minimum viable for your app to work. Use the right conventions (plural names for tables... etc - cf. the DB lectures).

💡 In order to harmonize the way to store user questions and assistant answers, you can include the following table, as well as the users table to handle Sign ins and Sign ups.

<details><summary markdown='span'>View solution
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="Database schema showing four tables: users, challenges, chats and messages, their relationships and columns">
</details>

#### 3 - Routes

Go back to your User stories spreadsheet and add the following information:
- **Verb**: `GET`
- **Path**: `/challenges`
- **Controller**: `challenges`
- **Action**: `index`

Create a ticket to validate them with a teacher. All good? Time for the `rails new`!

### Part II

Before splitting the tasks among the team, set your project up together. The **lead developer** (and only they) should:

#### 1. Create the Rails project with a Postgres config

Use Le Wagon's minimal template, which already has a good front-end setup:

```bash
cd ~/code/<user.github_nickname>
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```

Again, only the **lead developer** will do this! Not everyone in the team...

#### 2. Push the project on Github

```bash
cd your-rails-app-name
gh repo create --public --source=.
git push origin master
```

##### Add your teammates as collaborators on the Github repo

Go to your Github repo settings (`https://github.com/<user.github_nickname>/rails-airbnb-clone/settings/collaboration`) and add your teammates as **collaborators**.

##### Clone the project

The other teammates can now **clone** the project:

```bash
mkdir ~/code/<owner-github-nickname>
cd ~/code/<owner-github-nickname>
gh repo clone <owner-github-nickname>/<rails-app-name>
```

Then run:

```bash
cd <rails-app-name>
rails db:create db:migrate
bundle install
```


#### 3. Deploy on Heroku

Even if it's just a skeleton app, it's important to deploy on Heroku **from day one**, and then continuously deploy every day with each new feature.

```bash
heroku create ai-assistant-<user.lower_github_nickname> --region=REPLACE_WITH_REGION # (eu, us, or any region available in `heroku regions` list)
heroku config:set WEB_CONCURRENCY=1 # fixes temporary Heroku bug
git push heroku master
heroku run rails db:migrate
```

#### 4. GitHub Project

A [Kanban board](https://en.wikipedia.org/wiki/Kanban_board) is an agile project management tool designed to help visualize work, track progress, and maximize efficiency (or flow).

Github Projects Draft - To set up your kanban board on Github, you'll need to have the repository created already and to have all the collaborators added. Then, a team member can use [this board](https://github.com/orgs/lewagon/projects/117) as the basis for your project board. Follow the instructions [here](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project) to see how to copy and add the board to your own project's repository. Two things to note: Github doesn't copy over the cards from the original board, so you'll have to add them yourself. Feel free to copy/paste the cards to get you going, or just start from scratch. Second, Github uses markdown syntax for text formatting like headings, font style, and checkboxes. It's not required, but can be nice to add formatting to your cards. You can read more about it [here](https://guides.github.com/features/mastering-markdown/).

Each task should be in the format of a **User story** like: `As a user, I can see a list of all the challenges`

In the priority field, you can use the MoSCoW method to prioritize your user stories: Must have, Should have, Could have, Won't have. This will help you focus on the most important user stories first.

In the route field, you can include the verb, path, controller, and action, like: `GET /challenges challenges index` just like you have in the spreadsheet.

Make sure to use the [assign feature on GitHub](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/assigning-issues-and-pull-requests-to-other-github-users?ref=codebldr) to tag the team member who will be working on each user story.

From this point you can start splitting the tasks. **Spend time on the setup, because everything will be simpler if you do it correctly at the beginning**.

### Some guidelines for project management

#### Kick-off

Now, let's get the team started on the project. The lead developer has already created the Rails app, pushed it to Github, and deployed it on Heroku.

#### Coding as a team

Now you can break your team into two groups to start pair-programming on a few core features of your app. This is a good way to get started and to make sure you are all on the same page.

This is an opportunity to learn about [Pair programming](https://en.wikipedia.org/wiki/Pair_programming):

> Pair programming is a software development technique in which two programmers work together at one workstation. One, the driver, writes code while the other, the observer or navigator, reviews each line of code as it is typed in. The two programmers switch roles frequently.

Here are 3 scopes you can start working on already:

**Scope 1: Devise setup**:
- Setup Devise and generate the `User` model with devise. Make sure to use `rails g devise User` (not `rails g model`)!
- Go through the morning lecture to add the navbar, sign up and sign in pages (wrapped in Bootstrap cols), and setup the appropriate `before_action` and `skip_before_action` filters.

**Scope 2: Front-end kick-start**:
- Build a simple, attractive home page with a Bootstrap container, centered content, and a clear proposition value.

**Scope 3: Models generation**:
- _Note: Devise must be setup first! (Scope 1)_
- Generating the three other models will allow you to split the work up more easily after the **Coding as team** lecture.

**(Optional) Scope 4: Core model Read actions**:
Congratulations if you reach this step! Let's start coding the following user stories on your project's core model (replacing "challenges" with yours):
- As a visitor, I can see a list of challenges to navigate to the challenge I want to explore.
- As a visitor, I can click on a challenge to see its details

For each scope you work on, don't forget:

```bash
git checkout -b <feature-name>
```

And then to open a pull request on Github when you are done.

Don't forget to deploy your work on Heroku continuously, and to share your production URL on Slack before leaving.

#### Tasks organization

In the ~10 user stories listed in the spreadsheet, **some of these features are more important than others**. It's your role to prioritize them to get an MVP at the end of the week!

#### Code in silo, from model to view

When you work on a feature, work on it **conscientiously from the database to the HTML/CSS**. Let's take the example of creating a challenge:

*Model*
- I will generate a `Challenge` model and its associated migration.
- Then I will write a working model with associations and validations.
- I will then crash-test my model from the `rails console` to make sure everything in the model works.

*Routing*:
- I will add the new/create routes in `routes.rb`

*Controller*:
- I will add two `new` and `create` actions in the `ChallengesController`

*Views*:
- I will code the challenge form in `views/challenges/new.html.erb`
- The create action redirects to the `show` view, with a confirmation notice

*Links*:
- I will add a link to create a Challenge in the navbar.

*HTML/CSS*:
- My forms are clean with the correct Bootstrap classes for the inputs and buttons.
- My new challenge page is clean with a `container` to center the content, clear headers, and a clean design for each booking.
- I will take time to refactor my HTML using partials if my HTML code is too long and hard to read.

**Code it perfectly, from model to view**

- Crash test all your model associations and validations in the rails console.
- Don't neglect the view. If you add a form, make it a nice, centered and responsive Bootstrap form. If you code a flats list, build a nice Bootstrap grid (for example, with flat picture on the left and flat info on the right..).
- Use partials to refactor your HTML and make it more readable and maintainable.
