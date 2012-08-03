//
//  CMTwoToneProgressBar.m
//  TwoToneProgressBar
//
//  Created by Charlie Mezak on 9/22/10.
//  Copyright 2010 Natural Guides, LLC. All rights reserved.
//

#import "CMTwoToneProgressBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation CMTwoToneProgressBar

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		progress = 0.0;

		self.clipsToBounds = YES;
		self.layer.masksToBounds = YES;
		self.backgroundColor = [UIColor lightGrayColor];

		bar = [[UIView alloc] initWithFrame:CGRectMake(1, 1, progress * self.frame.size.width, self.frame.size.height)];
		bar.backgroundColor = [UIColor blackColor];
		[self addSubview:bar];
    }
    return self;
}

- (void)setProgress:(float)newProgress animated:(BOOL)animated {
	progress = newProgress;

	if (animated) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:MAX(0.3, abs(progress - newProgress))];
	}

	bar.frame = CGRectMake(0, 0, progress * self.frame.size.width, self.frame.size.height);

	if (animated) {
		[UIView commitAnimations];
	}
}

- (void)setProgressBarColor:(UIColor *)color {
	bar.backgroundColor = color;
}

- (void)setProgressBackgroundColor:(UIColor *)color {
	self.backgroundColor = color;	
}

@end