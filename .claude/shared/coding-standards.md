# coding-standards.md

General Rules:

* Keep files small and focused
* Prefer clarity over cleverness
* Avoid unnecessary abstractions
* Use descriptive names
* Write self-documenting code

Naming Rules:

* Components: PascalCase
* Composables: useXxx
* Services: XxxService
* Stores: useXxxStore
* Files: kebab-case where appropriate

Formatting Rules:

* Consistent indentation
* Remove dead code
* Remove unused imports
* Avoid long methods/functions

Frontend Rules:

* TypeScript everywhere
* Composition API only
* Avoid giant components
* Prefer composables over duplicated logic

Backend Rules:

* Thin controllers
* Business logic in services
* Use scopes for reusable queries
* Keep models focused

Testing Rules:

* Test behavior, not implementation
* Cover edge cases
* Test error states
* Tests are mandatory

Git Rules:

* Small commits
* Descriptive commit messages
* One feature per branch

Important:
Code should be easy to understand for future developers.
