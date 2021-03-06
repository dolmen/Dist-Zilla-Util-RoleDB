
use strict;
use warnings;

use strict;
use warnings;

package Dist::Zilla::Util::RoleDB::Items::ThirdParty;

# ABSTRACT: An aggregate provisioned index of third-party roles

my @items;

=method C<all>

Returns all items in this item set, as a list

    my @entries = $class->all();.

=cut

sub all {
  return @items if @items;
  _add_items();
  return @items;
}

sub _add_entry {
  my ( $name, $description, @extra ) = @_;
  require Dist::Zilla::Util::RoleDB::Entry;
  push @items, Dist::Zilla::Util::RoleDB::Entry->new( name => $name, description => $description, @extra );
  return;
}

sub _add_phase {
  my ( $name, $description, $phase_method, @extra ) = @_;
  require Dist::Zilla::Util::RoleDB::Entry::Phase;
  push @items,
    Dist::Zilla::Util::RoleDB::Entry::Phase->new(
    name         => $name,
    description  => $description,
    phase_method => $phase_method,
    @extra
    );
  return;
}

sub _add_items {
  _add_entry( q[-Bootstrap]              => q[Shared logic for bootstrap things.] );
  _add_entry( q[-BundleDeps]             => q[Automatically add all plugins in a bundle as dependencies] );
  _add_entry( q[-Git::DirtyFiles]        => q[provide the allow_dirty & changelog attributes] );
  _add_entry( q[-Git::LocalRepository]   => q[A plugin which works with a local git repository as its Dist::Zilla source.] );
  _add_entry( q[-Git::Remote::Branch]    => q[Parts to enable aggregated specification of remote branches.] );
  _add_entry( q[-Git::Remote::Check]     => q[Check a remote branch is not ahead of a local one] );
  _add_entry( q[-Git::Remote::Update]    => q[Update tracking data for a remote repository] );
  _add_entry( q[-Git::Remote]            => q[Git Remote specification and validation for plugins.] );
  _add_entry( q[-Git::Repo]              => q[Provide repository information for Git plugins] );
  _add_entry( q[-MetaProvider::Provider] => q[A Role for Metadata providers specific to the 'provider' key.] );
  _add_entry( q[-PluginBundle::Config::Slicer] => q[Pass Portions of Bundle Config to Plugins] );
  _add_entry( q[-PluginBundle::PluginRemover]  => q[Add '-remove' functionality to a bundle] );
  return;
}

1;
