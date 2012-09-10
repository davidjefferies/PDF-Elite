#!/usr/bin/perl

use lib '../lib';
use PDF::Elite;

#create the PDF
my $pdf = new PDF::Elite();

#Add a page to the PDF
$page = $pdf->new_page();

#add a font to the pdf
$font = $pdf->font('timesbold');

#add a text element to the page.  This must include text parameter and a font parameter.
my ($l, $b, $r, $t) = $page->add_Text(font => $font, text => "This is a wrapping test\n\nThis is a second line of the wrapping text",
                                      valign => 2, xpos => 100, ypos => 300, maxWidth => 100, textStyle => 2);
$page->add_Text(font => $font, text => 'Test me', xpos => $r, ypos => $b, maxWidth => 30);

#add a box to the page.  If it has a color parameter then it is just a box with no color filled in.
$page->add_Box(color => 'black', xpos => 100, ypos => 100, width => 50, height => 100);

#add a box to the page.  If it has a fill parameter then it is just a box with color filled in.
$page->add_Box(fill => 'yellow', xpos => 220, ypos => 100, width => 100, height => 100);

#add an image to the PDF.
my $img = $pdf->image(file => 'logo.jpg');

#use the image on the page
$page->add_Image(image => $img, height => 100);

#save the PDF as a file.
$pdf->saveAs('Test.pdf');

exit;