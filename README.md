# Event Manager

Implementation of an event manager webapp with authentication.

Check the Heroku live deplyoyment [here](https://pure-forest-02374.herokuapp.com/). (it will take a few seconds to spin-up)

Technical requirements:
- Authentication
  - Users can signup, login and logout
- Authorization
  - Users can't edit or delete other users:
    - profiles
    - events
    - attendances
- Users
  - Views
    - Can see an event index in the home page
    - Can see a list of their created an attended events
    - Future and Past events are presented separately
- Authenticated users:
  - Events:
    - Can create, edit and delete events.
    - Can create and delete attendances.

Further improvements ideas:
  - Support for a time field in the Event model.
  - Improve homepage (upcoming events, etc).
  - Archive and freeze past events.
  - Allow users to send invitations.
    - Make invite-only private events.

Implementation notes:
- basic and responsive Bootstrap UI
- Authentication implemented with the ```Devise``` gem.
  - The ```:username``` field had to be added to the crate and update form permited params.
    - Implementation according to [this reference.](https://dev.to/casseylottman/adding-a-field-to-your-sign-up-form-with-devise-10i1).
  - The ```destroy_user_session``` bug was fixed changing the Devise config to use the GET method for deletion and changing the routes for ```/users/sign_out```
    - Implementation according to [this reference.](https://github.com/heartcombo/devise/issues/4486#issuecomment-982626391).

---

This repo is an implementation of the [Private Events](https://www.theodinproject.com/lessons/ruby-on-rails-private-events) project.

This is part of [The Odin Project](https://www.theodinproject.com/).
