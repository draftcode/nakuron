//
//  nakuronViewController.m
//  nakuron
//

#import "nakuronViewController.h"
#import "Lib.h"

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

    SCREEN_WIDTH = [nakuronViewController getScreenWidth];
    SCREEN_HEIGHT = [nakuronViewController getScreenHeight];
    
    // seed
    int seed = arc4random() & 0x7FFFFFFF;

    // ステータスバーを消す。ここじゃなくて他のところに書くべき？
    // didFinishLaunchingWithOption とかに書くといいらしいけど、それどこ？
    //[UIApplication sharedApplication].statusBarHidden = YES;

    int colorNum = 4;
    NSString *cs[] = {@"red", @"blue", @"yellow", @"green"};
    colors = [[NSMutableArray alloc] initWithCapacity:colorNum];
    for (int i = 0; i < colorNum; i++) {
        [colors insertObject:[[Color alloc] initWithColorName:cs[i]] atIndex:i];
    }

    // seed 入力フォーム
    seedField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT/10, 150, 30)];
    seedField.keyboardType = UIKeyboardTypeNumberPad;
    seedField.borderStyle = UITextBorderStyleRoundedRect;
    seedField.clearButtonMode = UITextFieldViewModeAlways;
    seedField.text = [NSString stringWithFormat:@"%d", seed];
    [self.view addSubview:seedField];
    
    // seed 更新ボタン
    seedUpdateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    seedUpdateButton.frame = CGRectMake(SCREEN_WIDTH/2+20, SCREEN_HEIGHT/10, 100, 30);
    [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateNormal];
    [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateHighlighted];
    [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateDisabled];
    // ボタンがタッチダウンされた時にhogeメソッドを呼び出す
    [seedUpdateButton addTarget:self action:@selector(updateSeed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:seedUpdateButton]; 

    // 盤初期化
    board = [[Board alloc] initWithSize:8 seed:seed colors:colors];

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

-(void)updateSeed:(UIButton*)button {
    int seed = [seedField.text intValue];
    [seedField resignFirstResponder];
    [board dealloc];
    board = [[Board alloc] initWithSize:8 seed:seed colors:colors];
    [self showCells];
    [self show];
}

-(void)show {
    for (int i = 0; i < [board getBoardSize]; i++) {
        for (int j = 0; j < [board getBoardSize]; j++) {
            [[board getPieceWithCorrd:i y:j] updateImage];
        }
    }
}

-(void)showCells {
    // マスを表示
    for (int i = 0; i < [board getBoardSize]; i++) {
        for (int j = 0; j < [board getBoardSize]; j++) {
            CGRect frame = [board getCoordPxWithCoord:i y:j];
            UIImageView *imgs = [[UIImageView alloc]
                                 initWithFrame:frame];
            imgs.image = [UIImage imageNamed:@"sempty.png"];
            [self.view addSubview:imgs];
            [self.view addSubview:[[board getPieceWithCorrd:i y:j] getImageV]];
        }
    }

    // ボタンを表示
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(board->START_X_PX-35, (board->START_Y_PX+board->BOARD_SIZE_PX/2)-25, 50, 50);
    [leftButton setImage:[UIImage imageNamed:@"arrow-left.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:leftButton];

    UIButton *upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX/2)-25, (board->START_Y_PX)-35, 50, 50);
    [upButton setImage:[UIImage imageNamed:@"arrow-up.png"] forState:UIControlStateNormal];
    [upButton addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:upButton];
    
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX/2)-25, (board->START_Y_PX+board->BOARD_SIZE_PX)-15, 50, 50);
    [downButton setImage:[UIImage imageNamed:@"arrow-down.png"] forState:UIControlStateNormal];
    [downButton addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:downButton];

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX)-15, (board->START_Y_PX+board->BOARD_SIZE_PX/2)-25, 50, 50);
    [rightButton setImage:[UIImage imageNamed:@"arrow-right.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:rightButton];
}

-(void)left:(UIButton*)button{
    // ここに何かの処理を記述する
    // （引数の button には呼び出し元のUIButtonオブジェクトが引き渡されてきます）
    [board move:LEFT];
    [self show];
}

-(void)up:(UIButton*)button {
    [board move:UP];
    [self show];
}

-(void)right:(UIButton*)button {
    [board move:RIGHT];
    [self show];
}

-(void)down:(UIButton*)button {
    [board move:DOWN];
    [self show];
}

@end
