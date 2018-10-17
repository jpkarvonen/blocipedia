# Blocipedia: A custom wiki application built with Ruby on Rails

### Features Include:

* Three user roles: Admin, Standard, Premium
*	The Devise gem used for user authentication, which includes automated confirmation emails
* The Pundit gem used for authorization based on user roles
*	Allows users to upgrade from standard to the paid premium role with the Stripe gem
*	Public wikis can be edited by all users. Private wikis can only be seen and edited by premium users
*	Private wikis created by a premium user will automatically be made public if they downgrade
*	Wikis can be created with Markdown syntax through the Redcarpet gem
*	Premium users can add collaborators to their wikis regardless of their current role
*	FriendlyId gem enables readable URLs
