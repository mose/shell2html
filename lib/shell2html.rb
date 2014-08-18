module Shell2html

  module_function

  COLORS = {
    "1"   => { css: "sh_bold",            style: { "font-weight" => "bold" } },
    "2"   => { css: "sh_dim",             style: { "opacity" => ".5" } },
    "4"   => { css: "sh_underlined",      style: { "text-decoration" => "underline" } },
    "5"   => { css: "sh_blink",           style: { "text-decoration" => "blink" } },
    "7"   => { css: "sh_inverted",        style: { "font-weight" => "bold" } },
    "8"   => { css: "sh_hidden",          style: { "opacity" => "0" } },
    "39"  => { css: "sh_fg_default",      style: { "color" => "#ffffff" } },
    "30"  => { css: "sh_fg_black",        style: { "color" => "#000000" } },
    "31"  => { css: "sh_fg_red",          style: { "color" => "#cd0000" } },
    "32"  => { css: "sh_fg_green",        style: { "color" => "#00cd00" } },
    "33"  => { css: "sh_fg_yellow",       style: { "color" => "#cdcd00" } },
    "34"  => { css: "sh_fg_blue",         style: { "color" => "#1e90ff" } },
    "35"  => { css: "sh_fg_magenta",      style: { "color" => "#cd00cd" } },
    "36"  => { css: "sh_fg_cyan",         style: { "color" => "#00cdcd" } },
    "37"  => { css: "sh_fg_lightgray",    style: { "color" => "#e5e5e5" } },
    "90"  => { css: "sh_fg_darkgray",     style: { "color" => "#4c4c4c" } },
    "91"  => { css: "sh_fg_lightred",     style: { "color" => "#ff0000" } },
    "92"  => { css: "sh_fg_lightgreen",   style: { "color" => "#00ff00" } },
    "93"  => { css: "sh_fg_lightyellow",  style: { "color" => "#ffff00" } },
    "94"  => { css: "sh_fg_lightblue",    style: { "color" => "#4682b4" } },
    "95"  => { css: "sh_fg_lightmagenta", style: { "color" => "#ff00ff" } },
    "96"  => { css: "sh_fg_lightcyan",    style: { "color" => "#00ffff" } },
    "97"  => { css: "sh_fg_white",        style: { "color" => "#ffffff" } },
    "49"  => { css: "sh_bg_default",      style: { "background-color" => "#000000" } },
    "40"  => { css: "sh_bg_black",        style: { "background-color" => "#000000" } },
    "41"  => { css: "sh_bg_red",          style: { "background-color" => "#cd0000" } },
    "42"  => { css: "sh_bg_green",        style: { "background-color" => "#00cd00" } },
    "43"  => { css: "sh_bg_yellow",       style: { "background-color" => "#cdcd00" } },
    "44"  => { css: "sh_bg_blue",         style: { "background-color" => "#1e90ff" } },
    "45"  => { css: "sh_bg_magenta",      style: { "background-color" => "#cd00cd" } },
    "46"  => { css: "sh_bg_cyan",         style: { "background-color" => "#00cdcd" } },
    "47"  => { css: "sh_bg_lightgray",    style: { "background-color" => "#e5e5e5" } },
    "100" => { css: "sh_bg_darkgray",     style: { "background-color" => "#4c4c4c" } },
    "101" => { css: "sh_bg_lightred",     style: { "background-color" => "#ff0000" } },
    "102" => { css: "sh_bg_lightgreen",   style: { "background-color" => "#00ff00" } },
    "103" => { css: "sh_bg_lightyellow",  style: { "background-color" => "#ffff00" } },
    "104" => { css: "sh_bg_lightblue",    style: { "background-color" => "#4682b4" } },
    "105" => { css: "sh_bg_lightmagenta", style: { "background-color" => "#ff00ff" } },
    "106" => { css: "sh_bg_lightcyan",    style: { "background-color" => "#00ffff" } },
    "107" => { css: "sh_bg_white",        style: { "background-color" => "#ffffff" } }
  }

  def to_html(text, inline = false)
    text.gsub!(/\n/, '<br>')
    text.gsub!(/  /, ' &nbsp;')
    text.split(27.chr).map do |e|
      if /^\[([0-9;]+)m(.*)$/.match e
        case $1
        when '0'
          "</span>#{$2}"
        else
          key = $1
          t = $2
          css = []
          key.split(';').each do |i|
            css << COLORS["#{i.to_i}"] if COLORS["#{i.to_i}"]
          end
          if css.count > 0
            if inline
              span_style = css.map do |c|
                o = []
                c[:style].each do |k,v|
                  o << "#{k}:#{v}"
                end
                o
              end.flatten.join(';')
              "<span style=\"#{span_style}\">#{t}"
            else
              span_class = css.map { |c| c[:css] }.join(' ')
              "<span class=\"#{span_class}\">#{t}"
            end
          else
            "<span>#{t}"
          end
        end
      else
        e
      end
    end.join
  end

  def css
    back = []
    COLORS.each do |_, c|
      o = []
      css = c[:style].each do |k, v|
        o << "#{k}:#{v}"
      end
      back << ".#{c[:css]} { #{o.join(';')} }"
    end
    back.join("\n")
  end

  def to_sass(text)
  end

  def to_scss(text)
  end

end
