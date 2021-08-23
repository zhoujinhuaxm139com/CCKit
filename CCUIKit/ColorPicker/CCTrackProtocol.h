//
//  CCTrackProtocol.h
//  CCUIKit
//
//  Created by zjh on 2021/8/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CCTrackProtocolDelegate <NSObject>

-(void)trackingChangePoint:(CGPoint)point;

@end

@protocol CCTrackProtocol <NSObject>
@property (nonatomic,weak) id<CCTrackProtocolDelegate> delegate;

@property (nonatomic,assign) CGRect bounds;

@property (nonatomic,assign) CGFloat ringWidth;

@property (nonatomic,strong) UIColor *color;

@property (nonatomic,assign) CGPoint point;

@property (nonatomic,assign) CGFloat fingerTabWidth;

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;


@end

NS_ASSUME_NONNULL_END
