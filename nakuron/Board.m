//
//  Board.m
//  nakuron
//

#import "nakuronViewController.h"
#import "Board.h"
#import "Ball.h"
#import "Empty.h"
#import "Wall.h"
#import "Hole.h"
#import "ProgrammingException.h"
#import "Lib.h"
#import "NSString+Repeat.h"
#import "Piece.h"

@implementation Board

-(void)dealloc {
  [pieces release];
  [super dealloc];
}

-(void)setPieceWithCorrd:(int)x y:(int)y obj:(id)obj{
  [[pieces objectAtIndex:x] replaceObjectAtIndex:y withObject:obj];
}

-(void)dump {
  NSString* line = [@"=" repeatTimes:(BOARD_SIZE * 3) - 2];
  NSLog(@"%@", line);
  for (int i = 0; i < BOARD_SIZE; i++) {
    NSMutableArray* a = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
    for (int j = 0; j < BOARD_SIZE; j++) {
      [a addObject:[[[self getPieceWithCorrd:j y:i] description] substringToIndex:1]];
    }
    NSString* s = [a componentsJoinedByString:@", "];
    NSLog(@"%@", s);
  }
  NSLog(@"%@", line);
}

-(Board*)initWithSize:(int)size seed:(int)seed colors:(NSArray*)colors {
  score = 0;
  CGFloat w = SCREEN_WIDTH;
  CGFloat h = SCREEN_HEIGHT;

  Xor128 *hash = [Xor128 xor128WithSeed:seed];
  int hole = 80, wall = 20;

  // 盤面サイズ
  // (1,1) ... (BOARD_SIZE-2,BOARD_SIZE-2) が、球の存在しうる領域
  BOARD_SIZE = size + 2;

  // 盤面サイズ (px) の定義
  BOARD_SIZE_PX = (w * 12) / 16;

  // 盤面描画エリアを取得
  START_X_PX = (w - BOARD_SIZE_PX) / 2;
  START_Y_PX = (h - BOARD_SIZE_PX) / 2;
  END_X_PX = w - START_X_PX;
  END_Y_PX = h - START_Y_PX;

  // 1マスのサイズ
  CELL_SIZE_PX = (END_X_PX - START_X_PX) / BOARD_SIZE;

  // 縦480px、横320px の場合
  // BOARD_SIZE = 240,
  // START_X = 40, START_Y = 120, END_X = 280, END_Y = 360,

  // BOARD_SIZE ぶんの領域を確保して pieces を初期化
  NSMutableArray* rows = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
  pieces = [rows retain];
  for (int i = 0; i < BOARD_SIZE; i++) {
    // pieces[i] を初期化
    NSMutableArray* row = [NSMutableArray arrayWithCapacity:BOARD_SIZE];
    for (int j = 0; j < BOARD_SIZE; j++) {
      // pieces[i][j] を初期化
      PieceBody* body = nil;
      if (i == 0 || j == 0 || i == BOARD_SIZE-1 || j == BOARD_SIZE-1) {
        // 4隅
        if (i+j == 0 || i+j == BOARD_SIZE-1 || i+j == 2*(BOARD_SIZE-1)) {
          body = [Wall wall];
        } else {
          if ([hash randomInt:100] < hole) {
            body = [Hole holeWithColor:[colors objectAtIndex:[hash randomInt:[colors count]]]];
          } else {
            body = [Wall wall];
          }
        }
      } else {
        if ([hash randomInt:100] < wall) {
          body = [Wall wall];
        } else {
          body = [Ball ballWithColor:[colors objectAtIndex:[hash randomInt:[colors count]]]];
        }
      }
      [row addObject:[Piece pieceWithFrame:[self getCoordPxWithCoord:i y:j]
                                     image:[UIImage imageNamed:[body imageFileName]]
                                 pieceBody:body]];
    }
    [rows addObject:row];
  }

  return self;
}

-(int)getBoardSize {
  return BOARD_SIZE;
}

-(int)getScore {
  return score;
}

-(void)updatePieces {

}

-(void)move:(Direction)d {
  int start, end, dx, dy;
  switch (d) {
  case LEFT: start = 1; end = BOARD_SIZE-1; dy = 0; dx = 1; break;
  case UP: start = 1; end = BOARD_SIZE-1; dy = 1; dx = 0; break;
  case RIGHT: start = BOARD_SIZE-2; end = 0; dy = 0; dx = -1; break;
  case DOWN: start = BOARD_SIZE-2; end = 0; dy = -1; dx = 0; break;
  }

  if (dx == 0) {
    // 縦方向
    for (int i = 1; i != BOARD_SIZE-1; i++) {
      for (int j = start; j != end; j += dy) {
        if (!((start <= j && j <= end) || (end <= j && j <= start))) {
          [ProgrammingException error:@"ループ変数がボードの範囲外"];
        }
        int ty = j-dy;
        Piece *target, *tmp;
        target = tmp = [self getPieceWithCorrd:i y:ty];
        while ([tmp canWaitFor]) {
          target = tmp;
          ty -= dy;
          if (!(0 <= ty && ty < BOARD_SIZE)) break;
          tmp = [self getPieceWithCorrd:i y:ty];
        }
        [[self getPieceWithCorrd:i y:j] moveTo:target];
      }
    }
  } else {
    // 横方向
    for (int j = 1; j != BOARD_SIZE-1; j++) {
      for (int i = start; i != end; i += dx) {
        if (!((start <= i && i <= end) || (end <= i && i <= start))) {
          [ProgrammingException error:@"ループ変数がボードの範囲外"];
        }
        int tx = i-dx;
        Piece *target, *tmp;
        target = tmp =[self getPieceWithCorrd:tx y:j];
        while ([tmp canWaitFor]) {
          target = tmp;
          tx -= dx;
          if (!(0 <= tx && tx < BOARD_SIZE)) break;
          tmp = [self getPieceWithCorrd:tx y:j];
        }
        [[self getPieceWithCorrd:i y:j] moveTo:target];
      }
    }
  }
  [self dump];
}

-(CGRect)getCoordPxWithCoord:(int)x y:(int)y {
  //if (1 <= cell_x && cell_x <= BOARD_SIZE
  //    && 1 <= cell_y && cell_y <= BOARD_SIZE) {
  return CGRectMake(START_X_PX+x*CELL_SIZE_PX,
                    START_Y_PX+y*CELL_SIZE_PX,
                    CELL_SIZE_PX,
                    CELL_SIZE_PX);
  //} else {
  //    return nil;
  //}
}

-(Piece*)getPieceWithCorrd:(int)x y:(int)y {
  return [[pieces objectAtIndex:x] objectAtIndex:y];
}

@end
