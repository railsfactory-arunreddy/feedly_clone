// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import { Application } from "@hotwired/stimulus"

import HelloController from "./controllers/hello_controller"
import ModalController from "./controllers/modal_controller"

window.Stimulus = Application.start()
Stimulus.register("hello", HelloController)
Stimulus.register("modal", ModalController)