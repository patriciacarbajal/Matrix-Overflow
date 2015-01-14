# README

## MATRIX OVERFLOW

A redesign of StackOverflow with a focus on categorization, design, and organization.

Take the red pill and descend.

Creators: Karina, Liam, & Maggie

### Notes for Jokers
The goal was the restructure the way Stack Overflow is laid out. Rather than a singular page of most recent posts the home page would be present the user the currently most popular programming languages.

All posts made must be tied to a specific language and be about that language. So the resources for posts are nested within categories.

It’s important the note that categories should only be able to be created by an admin user. This is a feature that we have not implemented.

Currently the sight allows you to sign up, login, post in a category, and reply to a post.

Comments are instances of `Post`, but have an associated `parent` through a `parent_id` foreign key. If a post has comments, they will render by iterating through a post’s `children` and rendering each using a partial.

Our goals for the weekend were:

* Implement Voting
  * Votes are a single table with a polymorphic association on Posts
  * this is actually no longer necessary because comments and posts are both handled by the `Post` model.
  * Feel free to change this as necessary.
  * We also apparently spelled `votable` wrong.
* JQuery & AJAX
  * We were intending to use AJAX to keep the posting, voting, and commenting on a single page as much as possible.
* Maggie would kill me if I didn’t mention the ‘Easter Egg’ feature that would cover the page in pictures of Zack
* Admin Users
  * Admins would be able to generate new categories
  * We didn’t want standard users being able to generate categories at will
  * Maybe users could request new categories?
    * That’s up to you
* Finalize styling
  * We were intending to have a grid layout on the front page using tiles or cards to display each language category
  * Categories would be ordered by popularity (the number of posts within)
  * Posts within a category would be ordered by vote score
    * Comments could be similarly ordered, but not necessary
    * At this point recursive comments wouldn’t be too difficult to implement - your choice.





