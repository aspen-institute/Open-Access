# Open Access

Open Access is an initiative of [Food & Society at the Aspen Institute](https://www.aspeninstitute.org/programs/food-and-society-program/), with support generously provided by the [Robert Wood Johnson Foundation](https://www.rwjf.org/) (the views expressed here do not necessarily reflect the views of the Foundation). It’s an open-source code web portal that cities and organizations can use to help navigate how to plan, launch and grow small food businesses. To learn more about this project, please visit [https://www.aspeninstitute.org/programs/food-and-society-program/open-access-equitable-equity-for-food-entrepreneurs/](https://www.aspeninstitute.org/programs/food-and-society-program/open-access-equitable-equity-for-food-entrepreneurs/)

The portal structure was inspired by the business portal projects designed and built by [Code for America](https://codeforamerica.org/) and [Long Beach i-team](https://www.longbeach.gov/iteam/), and the template content was modeled on and drawn from the Franklin County Food Business Portal, Minneapolis Small Business portal, and the Long Beach i-team portal.

The application is build on Ruby on Rails. The application features a front end build with Bootstrap and a simple backend admin. Admin users can edit and update content as needed without coding experience. The block style editor used is [https://editorjs.io/](https://editorjs.io/)

## Other Considerations and Set up:

### Prerequisites

Ruby Version 3.1.1

Rails 7.02

### Devise

Depending on your application's configuration some manual setup may be required:

1. Ensure you have defined default url options in your environments files. Here is an example of default_url_options appropriate for a development environment in `config/environments/development.rb: config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` - Required for all applications\*

1. Ensure you have defined `root_url` to something in your `config/routes.rb`. For example:
   root to: `"home#index"` - Not required for API-only Applications\*

1. Ensure you have flash messages in `app/views/layouts/application.html.erb`

   For Example:

   ```
   <%= notice %>
   <%= alert %>
   ```

   - Not required for API-only Applications\*

1. You can copy Devise views(for customization) to you app by running:
   ```
   rails g devise:views
   ```
   - Not required\*

### Uploads

To directly upload photos, an image hosting service needs to be installed. Currently, all images are uploaded in the application’s folder

## License

This project is open source and can be used when crediting the source.

[Open Access](https://www.equitableaccessequity.org/) © 2022 by [Food & Society at the Aspen Institute](https://www.aspeninstitute.org/programs/food-and-society-program/) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1)
