//
//  ScrollSegmentedControl.m
//  NaoMiShoppingStreet
//
//  Created by god era on 13-6-18.
//  Copyright (c) 2013年 www.naomi.cn. All rights reserved.
//

#import "ScrollSegmentedControl.h"
#import "HMSegmentedControl.h"

@interface ScrollSegmentedControl ()

@property (retain,nonatomic) UIScrollView* scrollView;
@property (retain,nonatomic) HMSegmentedControl *hmsc;

@end


@implementation ScrollSegmentedControl

- (void)dealloc
{
    [_scrollView release];
    [_hmsc release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles
{
    self.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1];
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIScrollView* scrollTemp = [[[UIScrollView alloc] init]autorelease];
        self.scrollView = scrollTemp;
        scrollTemp.frame = self.bounds;
        scrollTemp.showsHorizontalScrollIndicator = NO;
        scrollTemp.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollTemp];

        
        HMSegmentedControl *hmsc = [[[HMSegmentedControl alloc] initWithSectionTitles:titles] autorelease];
        [hmsc addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        [hmsc setFont:[UIFont systemFontOfSize:18.0f]];
        [hmsc setTextColorNormal:RGBACOLOR(0x99, 0x99, 0x99, 1.0f)];
        hmsc.textColorSelected = COLOR_YELLOW1;
        [hmsc setSelectionIndicatorColor:COLOR_YELLOW1];
        hmsc.segmentEdgeInset = UIEdgeInsetsMake(5, 15, 0,15);
        [scrollTemp addSubview:hmsc];
        
        self.hmsc = hmsc;
        
        [self hmscConfig:hmsc withTitles:titles];

    }
    return self;
}

-(void)hmscConfig:(HMSegmentedControl*)hmsc withTitles:(NSArray*)titles
{
    _segmentCount = titles.count;
    
    self.scrollView.contentSize = CGSizeMake([hmsc segmentTotalWidth], 40.0);
    
    hmsc.origin = CGPointMake(0, 8);
    if ([hmsc segmentTotalWidth] < self.bounds.size.width) {
        CGPoint p = hmsc.center;
        p.x = self.bounds.size.width / 2.0;
        hmsc.center = p;
    }
}
- (void)segmentedControlChangedValue:(HMSegmentedControl*)segmentedControl {
	BMLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedIndex);
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollSegmentedControlDidSelectIndex:)]) {
        [self.delegate scrollSegmentedControlDidSelectIndex:segmentedControl.selectedIndex];
    }
}

-(NSUInteger)selectedIndex
{
    return self.hmsc.selectedIndex;
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self.hmsc setSelectedIndex:selectedIndex animated:YES];
}

- (void)updateTitles:(NSArray*)titles
{
    [self.hmsc updateTitles:titles];
    [self hmscConfig:self.hmsc withTitles:titles];
}

@end
