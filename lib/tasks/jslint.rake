desc "Check the JavaScript source with JSLint."
task :jslint do

  # Colorized output
  def colorize(text, color)
    "\033[#{color}m#{text}\033[0m"
  end

  def red(text)
    colorize(text, 31)
  end

  def green(text)
    colorize(text, 32)
  end

  puts " * Running JSLint over application js files and js specs"

  # List of files that should not be linted
  # like external libs
  white_list = [
      "/app/javascripts/lib/zepto.min.js"
  ]

  start_time = Time.now

  # Get all app files, except white listed
  # and all spec files to be sure they are also valid
  files_to_jslint = Dir[
      JwUiServer.root("app/javascripts/**/*.js"),
      JwUiServer.root("spec/javascripts/**/*[sS]pec.js")
  ]

  # JSLint files references for rhino and jslint files
  # relative to app root
  rhino_path = JwUiServer.root("/vendor/rhino/rhino.jar")
  jslint_path = JwUiServer.root("/vendor/jslint/jslint.js")
  
  failed = 0

  # Running through files list and execute jslint
  files_to_jslint.each do |name|
    relative_name = name.sub(JwUiServer.root, "")

    # Check if file matches white list patterns
    if white_list.any? { |white| name[white] }
      puts colorize("   - #{relative_name} white listed", 36)
    else
      # Running jslint over file and check if it passes
      result = `java -cp #{rhino_path} org.mozilla.javascript.tools.shell.Main #{jslint_path} #{name}`
      if result["jslint: No problems found in"]
        puts green("   - #{relative_name}")
      else
        failed += 1
        puts red("   - #{relative_name} failed lint: ")
        puts result.gsub(/^/, '     ')
      end
    end
  end

  output = " * #{files_to_jslint.size} files linted in #{Time.now - start_time} seconds. #{failed} failed."
  if failed > 0
    puts red(output)
    exit 1
  else
    puts output
  end
end
