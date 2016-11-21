//
//  BJView.h
//  Quartz2D
//
//  Created by bradleyjohnson on 2016/11/21.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DrawType) {
    DrawTypeLine = 0,
    DrawTypeBrokenLine,
    DrawTypeRect,
    DrawTypeRound,
    DrawTypeCircularArc,
    DrawTypeString,
    DrawTypeImage,
};

@interface BJView : UIView

@property (nonatomic , assign) DrawType type;

@end
