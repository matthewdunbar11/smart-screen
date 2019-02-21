// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "rails-ujs"
Rails.start()

import Turbolinks from "turbolinks"
Turbolinks.start()

import * as ActiveStorage from "activestorage"
ActiveStorage.start()

import "channels"

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

import bulma from "bulma-extensions";