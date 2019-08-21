Before() do
  visit ''
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.gsub(' ', '_').downcase!
  screenshot = page.save_screenshot("log/#{nome_cenario}.png")
  shot = Base64.encode64(File.open(screenshot, "rb").read)
  embed(shot, "image/png", "Confira a evidência")
end


