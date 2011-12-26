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
    [scoreLabel release];
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
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor blueColor]];
    
    boardView.colors = colors;
    [self generate:nil];

    [super viewDidLoad];    
}

- (void)viewDidUnload
{
    [board release];
    board = nil;
    [boardView release];
    boardView = nil;
    [scoreLabel release];
    scoreLabel = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)moveObjectFromRow:(int)fromY Col:(int)fromX ToRow:(int)toY Col:(int)toX Scored:(BOOL)scored
{
    if (scored) {
        score++;
        scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    }
}

#pragma mark - Actions

- (IBAction)retry:(id)sender {
    [sender resignFirstResponder];
    [board release];
    score = 0;
    scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    board = [[Board alloc] initWithSize:8 seed:seed colors:4];
    [board addObserver:self];
    boardView.board = board;
    [boardView setNeedsDisplay];
}

- (IBAction)generate:(id)sender {
    [sender resignFirstResponder];
    seed = arc4random() & 0x7FFFFFFF;
    [self retry:sender];
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
