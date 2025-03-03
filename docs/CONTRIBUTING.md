## DEVELOPMENT ROADMAP
- [x] Generate Django Admin CMS
- [x] Generate Django Restful API with Swagger Docs
- [x] Generate Fake Data builder
- [x] Generate ReactJS app
- [x] Cypress.io Test Suite

These are still needed:
- [ ] Implement Django [User Groups and Permissions](https://github.com/eliataylor/object-actions/blob/main/stack/django/oaexample_app/permissions.py)
- [ ] Implement React render checks against permissions like [can_verb](https://github.com/eliataylor/object-actions/blob/main/stack/reactjs/src/object-actions/types/access.tsx#L72)
- [ ] Implement Cypress tests against [permissions.json](https://github.com/eliataylor/object-actions/blob/main/stack/cypress/cypress/support/permissions.json). Fixtures can be generated by Databuilder
- [ ] Finish [K6 load tests](https://github.com/eliataylor/object-actions/blob/main/stack/k6/localhost.js)
- [ ] [Generate empty Worksheets](https://github.com/eliataylor/object-actions/blob/main/src/generate.py#L26) for given Object list. 
- [ ] Generate Django/TypeScript directly from [Google Sheets](https://github.com/eliataylor/object-actions/blob/main/src/generate.py#L26)
- [ ] Drupal builder
- [ ] KeystoneJS builder
