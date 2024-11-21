lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/
install:
	bundle install
	bundle update
