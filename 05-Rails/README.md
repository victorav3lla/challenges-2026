At last, Rails!

## First week - Rails 101

This is the last "real week" on Kitt with day-by-day challenges. From next week, you'll start working on longer projects, either an AI assistant or your own personal project. For now, we will dive into the architecture of a fresh Rails app and try to understand what's going on. **We'll build one Rails app per day**.

### `01 Routing, Controllers & Views`

Your first day will introduce the standard Rails flow of `routing > controller > view` without adding the model layer and explaining `params`. Over the course of the day, you'll be transforming old ruby challenges from Week 1 into Rails apps.

### `02 Models & CRUD`

Here comes our old friend Active Record again! **One of the most important Rails lectures.** Your lead coach will code all of the 7 CRUD actions from scratch and introduce the `resources` routing. Pay attention! 🤓

### `03 Advanced Routing`

Today you will add a second model to a Rails app by building a two model clone of Yelp, with restaurants and reviews. The morning lecture is about going **Beyond CRUD** with advanced routing and validations in Rails.

### `04 Rails Assets`

Learn the best setup for implementing Bootstrap SCSS + front-end libraries, and switch from `form_with` to `simple_form_for` using Simple Form Bootstrap config.

Learn about the asset pipeline.

For the exercises, you'll start a two-day build of a watch list app, with 3 models `Movie`, `Bookmark`, and `List`.
You will have to follow the front-end setup carefully to work on a nice-looking app.

### `05 Hosting & Image Upload`

This morning lecture has 2 parts:
**Hosting**: Deployment on [Heroku](http://heroku.com/)

**Image Upload**: We'll host images on [Cloudinary](http://cloudinary.com/), using [ActiveStorage](https://guides.rubyonrails.org/v6.0.1/active_storage_overview.html). The course also explains how you can secure your API keys using the [dotenv](https://github.com/bkeepers/dotenv) gem. **Listen carefully if you don't want your bank details stolen on Github.**

Also, **quiz time**! Your last one! Don't be sad 😢

We'll take a step back and check you've grasped all the core notions of Rails.

## Second part - AI Week

**AI Week**! For the second part, we'll work in your project teams of 3 or 4. The goal is to start from scratch and build an AI Assistant for a Persona and Goal - you'll have 5 blocks to go as far as you can on your AI Assistant.

- First demo at the halfway point - If a full-time bootcamp, on Wednesday (5pm)
- **Official demo on the last day!** If a full-time bootcamp, on Friday! (5pm)

**No live-code for this week.** But you still have morning lecture covering AI and Rails advanced topics. So get up early! Here is an overview of what will be covered:

### `06 Intro to LLMs`

2-part morning lecture:
- Intro to LLMs. You will build your first AI-based feature using [RubyLLM](https://rubyllm.com/) and understand the fundamentals of LLMs for Software Engineers.
- Authentication with [Devise](https://github.com/plataformatec/devise) gem.

### `07 Prompt Engineering`

2-part morning lecture:
- Prompt Engineering. You will learn how to write effective prompts for LLMs, which is a crucial skill to shape your AI Assistant behavior.
- Collaboration techniques with git & Github. You will discover how to work in a dev team using `branches` and `pull requests`. It's a system you will use for every dev project you ever do, so pay attention!


### `08 Conversational UX`

2-part morning lecture:
- Conversational UX: Allow users to follow-up on a first LLM answer by providing the conversation's history to the LLM. You will learn how to build a conversational UX in your Rails app using Turbo streams.
- JavaScript in Rails. Learn how to use Stimulus and `importmap` to implement new JavaScript features and to use third party libraries in Rails.

Then, every group should demo the current version of their AI Assistant in front of the class.

### `09 Multi-modal Inference`

Multi-modal Inference. You will learn how to send files along w/ text to be processed by LLMs.

### `10 Tools & Agents`

2-part morning lecture:
- Tools & Agents. You will learn how to write tools, to allow the LLM to decide when to use them, and to let the LLM call APIs or query your DB when relevant.
- WebSockets & ActionCable. You will learn how to stream answers in real-time for a better user experience.


### Projects prep (weekend)

You've done amazing things - we are really proud of you!

Now, it's time for the Grand Finale - your projects. Take a bit of time over the weekend to think about your projects:

- Write your user stories (not more than 15).
- Draw mockups of your main views on a paper.
- Start building your DB schema on [kitt.lewagon.com/db](http://kitt.lewagon.com/db).
- Start thinking about your routes.

If you can get most of this done, you'll save a lot of time on Monday and be able to start on your projects without too much fuss.
