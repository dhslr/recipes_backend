{ pkgs, ... }:

{
  languages.elixir.enable = true;
  dotenv.enable = true;
  services.postgres = {
    enable = true;
    initialScript = ''
      CREATE ROLE recipes WITH CREATEDB LOGIN PASSWORD 'recipes';
    '';
  };
  dotenv.disableHint = true;
  cachix.enable = false;

}
