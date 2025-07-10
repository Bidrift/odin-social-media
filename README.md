# Sodin Social App

This is an implementation of the final Ruby on Rails project within the Odin project series. It is a simple feed app where you can post, comment and control your profile and interact with other users.

# Demo

You can access the website from the following link if it is still up, otherwise, you could always try to deploy it on your own!

[Click here to view live version](https://odin-social-media.onrender.com/)

# Features

This project has the following features implemented:

- User sign in and sign up by email or by github (a welcome email is also sent)
- Users can create, edit and delete posts on their feed
- Users can comment and like posts. They can also edit and delete their comments, or delete others' comments on their own post
- Users can edit and view profiles, including their bio and profile picture
- Users can see other users, follow and manage their follow requests.

In the future, the project aims to have the following features:

- On posts feed, only posts of those who you follow will be displayed.
- Add images to posts via link and via upload
- Add notifications

# Technical features

In this project, the implementation features the following details:

- Perform security checks and authorization checks when doing requests
- Perform validations when submitting forms and giving feedback in case of errors
- Use Bootstrap for styling and Stimulus and Turbo for a friendly UI/UX
- Use ActiveStorage to persist file uploads and allow avatar changes
- Use Github API and Google STMP for mailing, and letter_opener for development

# Technical Stack

This project has the following languages or frameworks used:

- Ruby on Rails `8.0.2v`
- Bootstrap `5.3v`
- Stimulus and Turbo
- JavaScript
- libvips and image_processing
- Github API

# Future plans

I plan to:

- Add tests to the models and controllers in order to ensure maintainability

# Screenshots 

- Sign in form

![sign in](https://i.imgur.com/FEIl1vh.png)

- Posts feed with comments and likes

![posts feed](https://i.imgur.com/ont3h7V.png)

- Users list (with follows)

![users list](https://i.imgur.com/wVJTfFx.png)

- Current user profile

![own profile](https://i.imgur.com/PSFXcAV.png)

- Other user profile

![https://i.imgur.com/V0Q0fKP.png](https://i.imgur.com/V0Q0fKP.png)

# Installation

In order to install the project, make sure you have Rails, libvips and npm installed.

Simply copy the repository by using

```
git clone https://github.com/Bidrift/odin-social-media.git
cd odin-social-media 
```

And then run the following commands

```
bundle install
rails db:prepare
./bin/dev # OR rails s
```