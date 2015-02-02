#!/usr/bin/perl

use Tk;
use Digest::MD5 qw(md5_hex);

# create all our windows and widgets
my $mw = new MainWindow;

my $form = $mw->Frame()->pack();
my $label1 = $form->Label(-text=>"Input:");
my $text1 = $form->Text(-width=>40, -height=>10);

my $label2 = $form->Label(-text=>"MD5:");
my $text2 = $form->Text(-width=>40, -height=>10);

# organize them the way we want
$label1->grid(-row=>1, -column=>1, -pady=>4);
$text1->grid(-row=>2, -column=>1, -padx=>8);
$label2->grid(-row=>3, -column=>1, -pady=>4);
$text2->grid(-row=>4, -column=>1, -padx=>8);

# bind the keypress event
$text1->bind('<KeyPress>', sub{md5();});

# functions
sub md5 {
	$text2->delete('1.0', 'end');
	$text2->insert('end', md5_hex($text1->get('1.0', 'end')));
}

# tada!
MainLoop;
