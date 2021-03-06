use Renard::Incunabula::Common::Setup;
package Intertangle::Taffeta::Graphics::Role::CairoRenderable;
# ABSTRACT: A Cairo renderable graphics object

use Moo::Role;

use Intertangle::Taffeta::Types qw(CairoContext);
use Cairo;

=method render_cairo

  method render_cairo( (CairoContext) $cr )

Renders a a graphics object to L<Cairo>'s C<Cairo::Context>.

=cut
method render_cairo( (CairoContext) $cr ) {
	...
}

1;
