{ pkgs, ... }:
{

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    bindings = [
      # Movement
      {
        key = "h";
        command = "previous_column";
      }
      {
        key = "h";
        command = "jump_to_parent_directory";
      }
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "l";
        command = "next_column";
      }
      {
        key = "l";
        command = "enter_directory";
      }
      # Selection
      {
        key = "J";
        command = [
          "select_item"
          "scroll_down"
        ];
      }
      {
        key = "K";
        command = [
          "select_item"
          "scroll_up"
        ];
      }
      # Moving items
      {
        key = "ctrl-j";
        command = "move_selected_items_up";
      }
      {
        key = "ctrl-k";
        command = "move_selected_items_down";
      }
      # Volume
      {
        key = "-";
        command = "volume_down";
      }
      {
        key = "=";
        command = "volume_up";
      }
      # Modes
      {
        key = ";";
        command = "show_clock";
      }
      # Database
      {
        key = "U";
        command = "update_database";
      }
    ];
    settings = {
      visualizer_type = "spectrum";
      message_delay_time = 1;
      song_list_format = "{$4%a - }{%t}|{$8%f$9}$R{$3(%l)$9}";
      song_status_format = ''$b{{$8"%t"}} $3by {$4%a{ $3in $7%b{ (%y)}} $3}|{$8%f}'';
      song_library_format = "{%n - }{%t}|{%f}";
      alternative_header_first_line_format = "$b$1$aqqu$/a$9 {%t}|{%f} $1$atqq$/a$9$/b";
      alternative_header_second_line_format = "{{$4$b%a$/b$9}{ - $7%b$9}{ ($4%y$9)}}|{%D}";
      current_item_prefix = "$(cyan)$r$b";
      current_item_suffix = "$/r$(end)$/b";
      current_item_inactive_column_prefix = "$(magenta)$r";
      current_item_inactive_column_suffix = "$/r$(end)";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      progressbar_look = "->";
      media_library_primary_tag = "artist";
      media_library_albums_split_by_date = "no";
      startup_screen = "media_library";
      display_volume_level = "yes";
      ignore_leading_the = "yes";
      external_editor = "nvim";
      use_console_editor = "yes";
      empty_tag_color = "magenta";
      main_window_color = "white";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "blue:b";
      statusbar_color = "red";
      statusbar_time_color = "cyan:b";
    };
  };

}
