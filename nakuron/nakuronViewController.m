//
//  nakuronViewController.m
//  nakuron
//

#import "nakuronViewController.h"

@implementation nakuronViewController

+(CGFloat)getScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}
+(CGFloat)getScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

//*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ステータスバーを消す。ここじゃなくて他のところに書くべき？
    // didFinishLaunchingWithOption とかに書くといいらしいけど、それどこ？
    //[UIApplication sharedApplication].statusBarHidden	= YES;

    int colorNum = 4;
    NSString *cs[] = {@"red", @"blue", @"yellow", @"green"};
    colors = [[NSMutableArray alloc] initWithCapacity:colorNum];
    for (int i = 0; i < colorNum; i++) {
        [colors insertObject:[[Color alloc] initWithColorName:cs[i]] atIndex:i];
    }

    // 盤初期化
    board = [[Board alloc] initWithSize:8];
    
    // まず空のマスを描画
    [self showCells];

    // 球を描画
    [self show];
}
//*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)show {
    for (int i = 1; i <= [board getBoardSize]; i++) {
        for (int j = 1; j <= [board getBoardSize]; j++) {
            UIImageView *imgc = [[UIImageView alloc] initWithFrame:[board getCoordPxWithCoord:i y:j]];
            imgc.image = [[[board getPieceWithCorrd:i y:j] getImage] copy];
            //imgc.image = [UIImage imageNamed:@"cred.png"];
            [self.view addSubview:imgc];
        }
    }
}

-(void)showCells {
    for (int i = 1; i <= [board getBoardSize]; i++) {
        for (int j = 1; j <= [board getBoardSize]; j++) {
            UIImageView *imgs = [[UIImageView alloc] 
                                 initWithFrame:[board getCoordPxWithCoord:i y:j]];
            imgs.image = [UIImage imageNamed:@"sempty.png"];
            [self.view addSubview:imgs];
        }
    }
}

@end
