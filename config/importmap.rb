# config/importmap.rb

pin "application" # This is your main JavaScript entry point
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers" # Pining all controllers

