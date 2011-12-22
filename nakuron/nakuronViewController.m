//
//  nakuronViewController.m
//  nakuron
//

#import "nakuronViewController.h"
#import "Lib.h"
#import "Board.h"
#import "Piece.h"
#import "Color.h"

@implementation nakuronViewController

- (void)dealloc
{
  [seedField release];
  [board release];
  [colors release];

  [leftButton release];
  [upButton release];
  [downButton release];
  [rightButton release];

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

  SCREEN_WIDTH = [[UIScreen mainScreen] bounds].size.width;
  SCREEN_HEIGHT = [[UIScreen mainScreen] bounds].size.height;

  // 色の定義
  int colorNum = 4;
  NSString *cs[] = {@"red", @"blue", @"yellow", @"green"};
  NSMutableArray* tmpColors = [NSMutableArray arrayWithCapacity:colorNum];
  colors = [tmpColors retain];
  for (int i = 0; i < colorNum; i++) {
    [tmpColors addObject:[Color colorWithColorName:cs[i]]];
  }

  // seed
  seed = arc4random() & 0x7FFFFFFF;

  // 盤面表示
  [self initBoard];
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

-(void)initBoard {
  board = [[Board alloc] initWithSize:8 seed:seed colors:colors];
  [self showFeeds];
  [self showCells];
  [self showButtons];
  [self showMap];
}

-(void)updateSeed:(UIButton*)button {
  seed = [seedField.text intValue];
  for (UIView *view in [self.view subviews]) {
    [view removeFromSuperview];
  }
  [seedField resignFirstResponder];
  [board release];
  [self initBoard];
  [self showMap];
}

-(void)showMap {
  for (int i = 0; i < [board getBoardSize]; i++) {
    for (int j = 0; j < [board getBoardSize]; j++) {
      [[board getPieceWithCorrd:i y:j] updateImage];
    }
  }
  NSLog(@"subview = %d", [self.view.subviews count]);
}

-(void)showFeeds {
  // seed 入力フォーム
  seedField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT/10, 150, 30)];
  seedField.keyboardType = UIKeyboardTypeNumberPad;
  seedField.borderStyle = UITextBorderStyleRoundedRect;
  seedField.clearButtonMode = UITextFieldViewModeAlways;
  seedField.text = [NSString stringWithFormat:@"%d", seed];
  [self.view addSubview:seedField];
  
  // seed 更新ボタン
  UIButton* seedUpdateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  seedUpdateButton.frame = CGRectMake(SCREEN_WIDTH/2+20, SCREEN_HEIGHT/10, 100, 30);
  [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateNormal];
  [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateHighlighted];
  [seedUpdateButton setTitle:@"seed変更" forState:UIControlStateDisabled];
  [seedUpdateButton addTarget:self action:@selector(updateSeed:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:seedUpdateButton];
}

-(void)showCells {
  // マスを表示
  for (int i = 0; i < [board getBoardSize]; i++) {
    for (int j = 0; j < [board getBoardSize]; j++) {
      CGRect frame = [board getCoordPxWithCoord:i y:j];
      UIImageView *imgs = [[[UIImageView alloc]
                                 initWithFrame:frame] autorelease];
      imgs.image = [UIImage imageNamed:@"empty.png"];
      [self.view addSubview:imgs];
      [[board getPieceWithCorrd:i y:j].imageView removeFromSuperview];
      [self.view addSubview:[board getPieceWithCorrd:i y:j].imageView];
    }
  }
}

-(void)showButtons {
  // ボタンを表示
  leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
  leftButton.frame = CGRectMake(board->START_X_PX-35, (board->START_Y_PX+board->BOARD_SIZE_PX/2)-25, 50, 50);
  [leftButton setImage:[UIImage imageNamed:@"arrow-left.png"] forState:UIControlStateNormal];
  [leftButton addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:leftButton];
  
  upButton = [UIButton buttonWithType:UIButtonTypeCustom];
  upButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX/2)-25, (board->START_Y_PX)-35, 50, 50);
  [upButton setImage:[UIImage imageNamed:@"arrow-up.png"] forState:UIControlStateNormal];
  [upButton addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:upButton];
  
  downButton = [UIButton buttonWithType:UIButtonTypeCustom];
  downButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX/2)-25, (board->START_Y_PX+board->BOARD_SIZE_PX)-15, 50, 50);
  [downButton setImage:[UIImage imageNamed:@"arrow-down.png"] forState:UIControlStateNormal];
  [downButton addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:downButton];
  
  rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
  rightButton.frame = CGRectMake((board->START_X_PX+board->BOARD_SIZE_PX)-15, (board->START_Y_PX+board->BOARD_SIZE_PX/2)-25, 50, 50);
  [rightButton setImage:[UIImage imageNamed:@"arrow-right.png"] forState:UIControlStateNormal];
  [rightButton addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:rightButton];
}

-(void)left:(UIButton*)button{
  // ここに何かの処理を記述する
  // （引数の button には呼び出し元のUIButtonオブジェクトが引き渡されてきます）
  [board move:LEFT];
  [self showMap];
}

-(void)up:(UIButton*)button {
  [board move:UP];
  [self showMap];
}

-(void)right:(UIButton*)button {
  [board move:RIGHT];
  [self showMap];
}

-(void)down:(UIButton*)button {
  [board move:DOWN];
  [self showMap];
}

@end
