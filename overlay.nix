self: super:
let
  hoscOverrides = selfh: superh:
  let src = ./.; # add support for gitignore later
  in { hosc = selfh.callCabal2nix "hosc" src {};
     };
in {
  haskellPackages = super.haskellPackages.override (old: {
    overrides =
    super.lib.composeExtensions (old.overrides or (_: _: { })) hoscOverrides;
  });
}
