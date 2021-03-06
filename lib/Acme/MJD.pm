package Acme::MJD;
$VERSION = '0.02';

my $glass = " \t"x8;
sub reflect { local $_ = unpack "b*", pop; tr/01/ \t/; s/(.{9})/$1\n/g; $glass.$_ }
sub deflect { local $_ = pop; s/^$glass|[^ \t]//g; tr/ \t/01/; pack "b*", $_ }
sub opaque  { $_[0] =~ /\S/ }
sub deep    { $_[0] =~ /^$glass/ }

open 0 or print "Can't open '$0'\n" and exit;
(my $thought = join "", <0>) =~ s/.*^\s*use\s+Acme::MJD\s*;\n\n(?:.*?--\s+Mark\s+Jason\s+Dominus.*?\n)?//sm;

local $SIG{__WARN__} = \&opaque;
do {eval deflect $thought; exit} unless opaque $thought and not deep $thought;

my $DeepThought = '';
{
    my $rand = int rand 66;
    while($rand > 0){
        $DeepThought = <DATA>;
        $rand--;
    }
    close DATA;
    chomp $DeepThought;
    $DeepThought =~ s/^\#\d+\s//;

    require Text::Wrap;
    local $Text::Wrap::columns = 72;

    my @lines = Text::Wrap::wrap('', '', $DeepThought);

    if(length $lines[-1] < 63 ){
        $lines[-1] .= "  --  Mark Jason Dominus";
    } else {
        push @lines, "        --  Mark Jason Dominus";
    }

    $DeepThought = join "\n",@lines;
}

open 0, ">$0" or print "Cannot ponder '$0'\n" and exit;
print {0} "use Acme::MJD;\n\n$DeepThought\n", reflect $thought and exit;

=head1 NAME

Acme::MJD - Mark Jason Dominus does perl


=head1 SYNOPSIS

    use Acme::MJD;
    print "Hello world";

=head1 DESCRIPTION

The first time you run a program under C<use Acme::MJD>, the module
removes all the unsightly printable characters from 
your source file. The code continues to work exactly as it did before, 
but now it contains a profound nugget of wisdom from the man himself,
Mark Jason Dominus (E<lt>http://perl.plover.com/E<gt>).

These nuggets were mined from a comp.lang.perl.misc 
post by MJD entitled "Good Advice and Maxims for Programmers"
(E<lt>http://groups.google.com/groups?selm=a6ukat%24a4b%241%40plover.comE<gt>).

=head1 BUGS

Please don't report bugs ;)
But if you really really need to, go to 
E<lt>http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-MJDE<gt>
or send mail to E<lt>bug-Acme-MJD#rt.cpan.orgE<gt>


=head1 AUTHOR

	D. H. (PODMASTER)

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module distribution.


=head1 SEE ALSO

L<Acme::Bushisms|Acme::Bushisms>, L<Acme::Bleach|Acme::Bleach>, L<Acme::DeepThoughts|Acme::DeepThoughts>.

=cut

__DATA__
#11900 You cannot just paste code with no understanding of what is going on and expect it to work.
#11901 You can't just make shit up and expect the computer to know what you mean, Retardo!
#11902 You said it didn't work, but you didn't say what it would have done if it *had* worked.
#11903 What are you really trying to accomplish here?
#11904 Who the fuck cares which one is faster?
#11905 Now is the time in our program where you look at the manual.
#11906 Look at the error message!  Look at the error message!
#11907 Looking for a compiler bug is the strategy of LAST resort.  LAST resort.
#11908 Premature optimization is the root of all evil.
#11909 Bad programmer!  No cookie!
#11910 I see you omitted $! from the error message.   It won't tell you what went wrong if you don't ask it to.
#11911 You wrote the same thing twice here.  The cardinal rule of programming is that you never ever write the same thing twice.
#11912 Evidently it's important to you to get the wrong answer as quickly as possible.
#11913 Gee, I don't know.  I wonder what the manual says about that?
#11914 Well, no duh.  That's because you ignored the error message, dimwit.
#11915 Only Sherlock Holmes can debug the program by pure deduction from the output.  You are not Sherlock Holmes.  Run the fucking debugger already.
#11916 Always ignore the second error message unless the meaning is obvious.
#11917 Read.  Learn.  Evolve.
#11918 Well, then get one that *does* do auto-indent.  You can't do good work with bad tools.
#11919 No.  You must believe the ERROR MESSAGE.  You MUST believe the error message.
#11920 The error message is the Truth.  The error message is God.  
#11921 It could be anything.  Too bad you didn't bother to diagnose the error, huh?
#11922 You don't suppress error messages, you dumbass, you PAY ATTENTION and try to understand them.
#11923 Never catch a signal except as a last resort.
#11924 Well, if you don't know what it does, why did you put it in your program?
#11925 Gosh, that wasn't very bright, was it?
#11926 That's like taking a crap on someone's doorstep and then ringing the doorbell to ask for toilet paper.
#11927 A good approach to that problem would be to hire a computer programmer.
#11928 First get a book on programming.  Then read it.  Then write the program.
#11929 First ask yourself `How would I do this without a computer?'  Then have the computer do it the same way.
#11930 Would you like to see my rate card?
#11931 I think you are asking the wrong question here.
#11932 Holy cow.
#11933 Because it's a syntax error.
#11934 Because this is Perl, not C.
#11935 Because this is Perl, not Lisp.
#11936 Because that's the way it is.
#11937 Because.
#11938 If you have `some weird error', the problem is probably with your frobnitzer.
#11939 Because the computer cannot read your mind.  Guess what?  I cannot read your mind *either*.
#11940 You said `It doesn't work'.  The next violation will be punished by death.
#11941 Of course it doesn't work!  That's because you don't know what you are doing!
#11942 Sure, but you have to have some understanding also.
#11943 Ah yes, and you are the first person to have noticed this bug since 1987.  Sure.
#11944 Yes, that's what it's supposed to do when you say that.
#11945 Well, what did you expect?
#11946 Perhaps you have forgotten that this is an engineering discipline, not some sort of black magic.
#11947 You know, this sort of thing is amenable to experimental observation.
#11948 Perhaps your veeblefitzer is clogged.
#11949 What happens when you try?
#11950 Now you are just being superstitious.  
#11951 Your question has exceeded the system limit for pronouns in a single sentence.  Please dereference and try again.
#11952 In my experience that is a bad strategy, because the people who ask such questions are the ones who paste the answer into their program without understanding it and then complain that it `does not work'.
#11953 Of course, this is a heuristic, which is a fancy way of saying that it doesn't work. 
#11954 If your function is written correctly, it will handle an empty array the same way as a nonempty array.
#11955 When in doubt, use brute force.
#11956 Well, it might be more intuitive that way, but it would also be useless.
#11957 Show the code.
#11958 The bug is in you, not in Perl.
#11959 Cargo-cult.
#11960 So you threw in some random punctuation for no particular reason, and then you didn't get the result you expected.  Hmmmm.
#11961 How should I know what is wrong when I haven't even seen the code?  I am not clairvoyant.
#11962 How should I know how to do what you want when you didn't say what you wanted to do?
#11963 It's easy to get the *wrong* answer in O(1) time.
#11964 I guess this just goes to show that you can lead a horse to water, but you can't make him drink it.
#11999 You are a stupid asshole.  Shut the fuck up.