{ pkgs, ... }:
{

  # TODO: Use home-manager's built-in hwatch module when it becomes available.
  home.packages = with pkgs; [ hwatch ];

}
