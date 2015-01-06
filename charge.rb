# coding: utf-8
require 'fest'

charge = `cat /sys/class/power_supply/BAT0/capacity`.to_i
status = `cat /sys/class/power_supply/BAT0/status`.chomp!

@fest = Fest.new
procent = @fest.pluralform(charge, ["процент",
                                    "процента",
                                    "процентов"])
@fest.say(
  if status == "Discharging" && charge > 10 && charge < 50
    "Заряд батареи #{charge} #{procent}"
  elsif status == "Discharging" && charge < 10
    "Критический заряд батареи."
  end
)
