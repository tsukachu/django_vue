terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "4.5.1"
    }
  }

  required_version = "= 1.0.1"

  backend "pg" {
  }
}

provider "heroku" {
  # Configuration options
}

resource "heroku_app" "main" {
  name   = "django-vue-on-heroku"
  region = "us"
  buildpacks = [
    "heroku/nodejs",
    "heroku/python"
  ]
  config_vars = {
    DISABLE_COLLECTSTATIC = 1
    DJANGO_SETTINGS_MODULE = "django_vue.settings.production"
  }
}

resource "heroku_addon" "database" {
  app  = heroku_app.main.name
  plan = "heroku-postgresql:hobby-dev"
}
