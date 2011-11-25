//
//  nakuronViewController.m
//  nakuron
//
//  Created by dai on 11/10/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "nakuronViewController.h"

@implementation nakuronViewController

static nakuronViewController *instance = nil;

+(id)getInstance {
    return instance;
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
    
    instance = self;
   
    // ステータスバーを消す。ここじゃなくて他のところに書くべき？
    // didFinishLaunchingWithOption とかに書くといいらしいけど、それどこ？
    //[UIApplication sharedApplication].statusBarHidden	= YES;
    
    // 盤初期化
    display = [[Display alloc] init];

    // まず空のマスを描画
    for (int i = 1; i <= [[display getBoard] getBoardSize]; i++) {
        for (int j = 1; j <= [[display getBoard] getBoardSize]; j++) {
            UIImage *img = [UIImage imageNamed:@"sempty.png"];
            UIImageView *imgv = [[UIImageView alloc] 
                                 initWithFrame:[[display getBoard] 
                                                getCoordWithCell:i cell_y:j]];
            imgv.image = img;
            [self.view addSubview:imgv];
        }
    }
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

@end
