//
//  ScrollSegmentedControl.h
//  NaoMiShoppingStreet
//
//  Created by god era on 13-6-18.
//  Copyright (c) 2013年 www.naomi.cn. All rights reserved.
//
/*
 Example:
NSArray* titles = [NSArray arrayWithObjects:@"Hi",@"Girl",@"Boy", nil];
ScrollSegmentedControl* ssc = [[[ScrollSegmentedControl alloc] initWithTitles:titles]autorelease];
ssc.delegate = self;
[self.view addSubview:ssc];
*/
#define HIGHT_SEGMENTED_CONTROL 46
#import <UIKit/UIKit.h>

@protocol ScrollSegmentedControlDelegate;


@interface ScrollSegmentedControl : UIView

@property (assign,nonatomic) NSUInteger selectedIndex; // default is 0
@property (assign,nonatomic,readonly) NSUInteger segmentCount; // default is 0

@property (assign,nonatomic) id<ScrollSegmentedControlDelegate> delegate;

//initialization method.
//titles example:[NSArray arrayWithObjects:@"Hi",@"Girl",@"Boy", nil]
- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;
- (void)updateTitles:(NSArray*)titles;

@end

#pragma mark - ScrollSegmentedControlDelegate
@protocol ScrollSegmentedControlDelegate<NSObject>

- (void)scrollSegmentedControlDidSelectIndex:(NSUInteger)index;

@end