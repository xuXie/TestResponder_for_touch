//
//  TSViewController.m
//  TestResponder
//
//  Created by xiexu on 13-11-28.
//  Copyright (c) 2013年 Chi Chuang CO.,LTD. All rights reserved.
//

#import "TSViewController.h"
#import "TSCell.h"
#import "TSButton.h"

@interface TSViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onButtonActionPress:(id)sender{
    NSLog(@"button 接收点击事件");
    NSLog(@"button nextResponder----%@",[sender nextResponder]);
    NSLog(@"button nextResponder nextResponder----%@",[[sender nextResponder] nextResponder]);
//    [[[sender superview] superview] nextResponder];
}

#pragma -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *s_identify=@"cell";
    TSCell *l_cell=[tableView dequeueReusableCellWithIdentifier:s_identify];
    
    if (l_cell==nil) {
        
        l_cell=[[TSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:s_identify];
        
//        UIButton *l_btn=[[UIButton alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
        TSButton *l_btn=[[TSButton alloc] initWithFrame:l_cell.frame];
        [l_btn setBackgroundColor:[UIColor blueColor]];
        [l_btn addTarget:self action:@selector(onButtonActionPress:) forControlEvents:UIControlEventTouchUpInside];
        [l_btn setUserInteractionEnabled:YES];
        [l_cell addSubview:l_btn];
        
    }
    
    
    return l_cell;
}
#pragma -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell 接收点击事件");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 这里可以做子view自己想做的事，做完后，事件继续上传，就可以让其父类，甚至父viewcontroller获取到这个事件了
//    NSLog(@"touches nextResponder----%@",[self nextResponder]);
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[[self nextResponder] nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesMoved:touches withEvent:event];
}
@end
