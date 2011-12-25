//
//  nakuronViewController.m
//  nakuron
//

#import "nakuronViewController.h"
#import "BoardView.h"
#import "Lib.h"
#import "Board.h"

@implementation nakuronViewController

- (void)dealloc
{
    [board release];
    [boardView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:4];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor greenColor]];
    
    seed = arc4random() & 0x7FFFFFFF;
    [board release];
    board = [[Board alloc] initWithSize:8 seed:seed colors:4];
    boardView.board = board;
    boardView.colors = colors;
    
    [super viewDidLoad];    
}

- (void)viewDidUnload
{
    [board release];
    board = nil;
    [boardView release];
    boardView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)generate:(id)sender {
    [sender resignFirstResponder];
    seed = arc4random() & 0x7FFFFFFF;
    [board release];
    board = [[Board alloc] initWithSize:8 seed:seed colors:4];
    boardView.board = board;
    [boardView setNeedsDisplay];
}

- (IBAction)up:(id)sender {
    [board move:UP];
    [boardView setNeedsDisplay];
}

- (IBAction)left:(id)sender {
    [board move:LEFT];
    [boardView setNeedsDisplay];
}

- (IBAction)right:(id)sender {
    [board move:RIGHT];
    [boardView setNeedsDisplay];
}

- (IBAction)down:(id)sender {
    [board move:DOWN];
    [boardView setNeedsDisplay];
}

@end
