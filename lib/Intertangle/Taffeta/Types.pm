use Renard::Incunabula::Common::Setup;
package Intertangle::Taffeta::Types;
# ABSTRACT: Types for Taffeta

use Type::Library 0.008 -base,
	-declare => [qw(
		CairoContext
		SVG

		ColorLibrary
		RGB24Value
		RGB24Component
		RGBFloatComponentValue
		Color

		Opacity
		Dimension
	)];
use Type::Utils -all;
use Types::Standard qw(Str);
use Types::Common::Numeric qw(PositiveOrZeroInt PositiveOrZeroNum);

use Color::Library;

=type CairoContext

A type for any reference that extends L<Cairo::Context>.

=cut
class_type "CairoContext",
	{ class => 'Cairo::Context' };

=type SVG

A type for any reference that extends L<SVG::Element>.

=cut
class_type "SVG",
	{ class => "SVG::Element" };

=type ColorLibrary

A type for any reference that extends L<Color::Library::Color>

Coercible from a C<Str> such as C<svg:blue>.

=cut
class_type "ColorLibrary",
	{ class => 'Color::Library::Color' };

coerce "ColorLibrary",
	from Str, via { Color::Library->color($_) };

=type RGB24Value

A valid RGB value between C<0> and C<0xFFFFFF>.

=cut
declare RGB24Value =>
	as PositiveOrZeroInt,
	where { $_ <= 0xFFFFFF };

=type RGB24Component

A valid component of a C<RGB24Value> between C<0> and C<0xFF>.

=cut
declare RGB24Component =>
	as PositiveOrZeroInt,
	where { $_ <= 0xFF };

=type RGBFloatComponentValue

A type for a C<Num> that falls in the range for a RGB float component value.

=cut
declare RGBFloatComponentValue =>
	as PositiveOrZeroNum,
	where { $_ <= 1.0 };

=type Color

A type for any reference that extends L<Intertangle::Taffeta::Color>.

=cut
class_type "Color",
	{ class => 'Intertangle::Taffeta::Color' };

=type Opacity

A type for a C<Num> that falls in the range for an opacity value.

=cut
declare Opacity =>
	as PositiveOrZeroNum,
	where { $_ <= 1.0 };

=type Dimension

A type for a C<Num> that can represent a dimension.

=cut
declare Dimension =>
	as PositiveOrZeroNum;

1;
