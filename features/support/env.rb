require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'site_prism'
require 'faker'
require 'rubygems'
require 'rspec'

AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
CUSTOM = YAML.load_file(File.dirname(__FILE__) + "/config.yml")

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << "--headless"
      opts.args << "--disable-gpu" if Gem.win_platform?
      opts.args << "--no-sandbox"
      opts.args << "--disable-site-isolation-trials"
      opts.args << "--log-level=3"
      opts.args << "--window-size=1280x1024"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end
  @driver = :selenium_chrome_headless
when "internet_explorer"
  Capybara.register_driver :ie do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
    caps['ie.ensureCleanSession' => true]
    caps['ie.browserCommandLineSwitches' => 'private']
    caps['requireWindowFocus' => true]
    caps['ignoreZoomSetting' => true]
    caps['ignoreProtectedModeSettings' => true]
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer, :desired_capabilities => caps)
  end
  @driver = :ie
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 30
  Capybara.page.driver.browser.manage.window.resize_to(1280, 1024)
end