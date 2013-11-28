//
//  TSButton.m
//  TestResponder
//
//  Created by xiexu on 13-11-28.
//  Copyright (c) 2013年 Chi Chuang CO.,LTD. All rights reserved.
//

#import "TSButton.h"

@implementation TSButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 这里可以做子view自己想做的事，做完后，事件继续上传，就可以让其父类，甚至父viewcontroller获取到这个事件了
    NSLog(@"button touchesBegan");
    UIResponder *l_responder_cell=nil;
    //友情提示：ios7.0 cell上的子视图多了一层类似于scrollview的东东
    NSLog(@"[self nextResponder]----%@",[self nextResponder]);
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        l_responder_cell = [[self nextResponder] nextResponder];
    }else{
        l_responder_cell = [self nextResponder];
    }
    [l_responder_cell touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"button touchesEnded");
    UIResponder *l_responder_cell=nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        l_responder_cell = [[self nextResponder] nextResponder];
    }else{
        l_responder_cell = [self nextResponder];
    }
    [l_responder_cell touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"button touchesCancelled");
    UIResponder *l_responder_cell=nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        l_responder_cell = [[self nextResponder] nextResponder];
    }else{
        l_responder_cell = [self nextResponder];
    }
    [l_responder_cell touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"button touchesMoved");
    UIResponder *l_responder_cell=nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        l_responder_cell = [[self nextResponder] nextResponder];
    }else{
        l_responder_cell = [self nextResponder];
    }
    [l_responder_cell touchesMoved:touches withEvent:event];
}
@end
